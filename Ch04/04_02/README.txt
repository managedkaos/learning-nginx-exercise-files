# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx is installed for you in this lesson.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -

# Remove the default configuration
    unlink /etc/nginx/sites-enabled/default

# Create a the new configuration
    vim /etc/nginx/conf.d/upstream.conf

# Add the following contents to /etc/nginx/conf.d/upstream.conf:
    upstream app_server_7001 {
        server 127.0.0.1:7001;
    }

    server {
        listen 80;

        location /proxy {
            # Trailing slash is key!
            proxy_pass http://app_server_7001/;
        }
    }
# Test and reload the configuration
    nginx -t
    systemctl reload nginx

# Start the app servers
    /usr/bin/python3 /vagrant/start_app_servers.py &

# Open the proxy location in a browser: http://192.168.0.3/proxy

# Refresh the page several times

