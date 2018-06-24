# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx unzip php-fpm php-mysql mariadb-server mariadb-client

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

# Secure MySQL
# !!Not for production use!! :D
mysql_secure_installation <<EOF
n
123
123
y
y
y
y
y
EOF

# Set up appointment database
mysql -u root -p123 < /vagrant/appointment_database_setup.sql

# Load the configuration
systemctl reload nginx

