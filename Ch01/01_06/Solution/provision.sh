# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisdompetmed.local
echo 'site coming soon' > /var/www/wisdompetmed.local/index.html

# Load the configuration
systemctl reload nginx

