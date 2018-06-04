'''Module: Starts three HTTP servers'''
import os
import socket
import http.server
import socketserver
from pathlib import Path

# list of the ports the servers will listen on
PORTS = [7001, 7002, 7003]

# list to hold the PIDs from the forked servers
SERVERS = []

# setup a 1 second timeout for the ports
SOCK = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
SOCK.settimeout(1)

# class for setting up socket reuse
class MyTCPServer(socketserver.TCPServer):
    '''Class: setups up socket reuse'''
    def server_bind(self):
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.bind(self.server_address)

# function for starting the server
def start_server(server_port):
    '''Function: Writes an index file and starts the server'''
    server_root = '/tmp/server_' + str(server_port)
    server_index = server_root + '/index.html'

    # create the path to the server root if it does not exist
    Path(server_root).mkdir(parents=True, exist_ok=True)

    # write the HTML to the index file
    index = open(server_index, 'w')
    index.write("""
    <!DOCTYPE html>
    <html>
        <head>
            <style> h1 {
                        font-size:200px;
                        text-align:center;
                        margin-left:auto;
                        margin-right:auto
                       }
            </style>
        </head>
        <body>
            <h1>"""+str(server_port)+"""</h1>
        </body>
    </html>
    """)
    index.close()

    # create a handler for the HTTP server
    handler = http.server.SimpleHTTPRequestHandler

    # start/stop the HTTP server
    with MyTCPServer(("", server_port), handler) as httpd:
        try:
            print("serving at port:", server_port)
            os.chdir(server_root)
            httpd.serve_forever()
        except KeyboardInterrupt:
            httpd.shutdown()
            print("stopping at port:", server_port)

# start a fork for each port
for port in PORTS:
    pid = os.fork()

    if pid:
        SERVERS.append(pid)
    else:
        start_server(port)
        exit(0)

# wait for the servers to finish, bailing out on CTRL+C
for server in SERVERS:
    try:
        os.waitpid(server, 0)
    except KeyboardInterrupt:
        exit(0)
