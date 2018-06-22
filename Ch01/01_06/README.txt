# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx is installed and configured for you in this lesson.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -
    vim /etc/nginx/conf.d/wisdompetmed.local.conf

# Edit /etc/nginx/conf.d/wisdompetmed.local.conf so that is has the
# following contents and then save the file:

	server {
		listen 80 default_server;
		root /var/www/wisomdpetmed.local;

		server_name wisdompetmed.local www.wisdompetmed.local;
		index index.html index.htm index.php;
	}

# Now continue with the following commands
    nginx -t
    systemctl reload nginx

# Open the site in your browser: http://192.168.0.3

# Or use the following curl command to view the site from the CLI
    curl localhost
