# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx unzip

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisdompetmed.local
unzip /vagrant/Wisdom_Pet_Medicine_responsive_website_LYNDA_12773.zip -d /var/www/wisdompetmed.local
find /var/www/wisdompetmed.local -type f -exec chmod 644 {} \; -print
find /var/www/wisdompetmed.local -type d -exec chmod 755 {} \; -print

# Load the configuration
systemctl reload nginx

