# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /vagrant/upstreams.conf /etc/nginx/conf.d

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
/usr/bin/python3 /vagrant/start_app_servers.py &
