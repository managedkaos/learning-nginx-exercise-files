import os
import socket
import http.server
import socketserver
from pathlib import Path

# setup a 1 second timeout for the ports
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.settimeout(1)

class MyTCPServer(socketserver.TCPServer):
    def server_bind(self):
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.bind(self.server_address)

servers = []
PORTS = [7001,7002,7003]

def start_server(server_port):
    server_root  = '/tmp/server_' + str(server_port)
    server_index = server_root + '/index.html'

    Path(server_root).mkdir(parents=True, exist_ok=True)
    
    f = open(server_index,'w')
    f.write('<!DOCTYPE html><html><head><style>h1{font-size:200px;text-align:center;margin-left:auto;margin-right:auto}</style></head><body><h1>'+str(server_port)+'</h1></body></html>')
    f.close()

    Handler = http.server.SimpleHTTPRequestHandler
    with MyTCPServer(("", server_port), Handler) as httpd:
        try:
            print("serving at port:", server_port)
            os.chdir(server_root)
            httpd.serve_forever()
        except:
            httpd.shutdown()
            print("stopping at port:", server_port)


for port in PORTS:
    pid = os.fork()

    if pid:
        servers.append(pid)
    else:
        start_server(port)
        os._exit(0)

for server in servers:
    try:
        os.waitpid(server, 0)
    except KeyboardInterrupt:
        os._exit(0)
