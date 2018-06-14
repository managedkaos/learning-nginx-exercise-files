# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx unzip php-fpm php-mysql

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisdompetmed.local
unzip /vagrant/Wisdom_Pet_Medicine_responsive_website_LYNDA_12773.zip -d /var/www/wisdompetmed.local
find /var/www/wisdompetmed.local -type f -exec chmod 644 {} \; -print
find /var/www/wisdompetmed.local -type d -exec chmod 755 {} \; -print

# Install a php info script
cp /vagrant/info.php /var/www/wisdompetmed.local
chmod +r /var/www/wisdompetmed.local/info.php

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
systemctl restart php7.2-fpm
systemctl status php7.2-fpm.service --no-pager
