# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default




/usr/bin/python3 /vagrant/start_app_servers.py &
