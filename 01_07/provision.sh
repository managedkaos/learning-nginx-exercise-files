# Update the package references
apt-get update

# Install nginx, php, mariadb, and elinks
apt-get install -y nginx

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisdomdpetmed.local
echo 'site coming soon' > /var/www/wisdompetmed.local/index.html

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
