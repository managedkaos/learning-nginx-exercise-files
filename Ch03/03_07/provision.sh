# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx unzip php-fpm php-mysql mariadb-server mariadb-client apache2-utils

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

# Install the appointments script
mkdir /var/www/wisdompetmed.local/appointments
cp /vagrant/index.php /var/www/wisdompetmed.local/appointments
chmod +r /var/www/wisdompetmed.local/appointments/index.php

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

# Insert the appointment data
mysql -u admin -padmin appointments < /vagrant/appointment_database.sql

# Create the /denied directory and index file and 403.html
mkdir /var/www/wisdompetmed.local/deny
echo "YOU'LL NEVER SEE THIS! :D" > /var/www/wisdompetmed.local/deny/index.html
chmod +r /var/www/wisdompetmed.local/deny/index.html
cp /vagrant/403.html /var/www/wisdompetmed.local
chmod +r /var/www/wisdompetmed.local/403.html

# Create 401.html
cp /vagrant/401.html /var/www/wisdompetmed.local
chmod +r /var/www/wisdompetmed.local/401.html

# Create a password for securing locations
htpasswd -b -c /etc/nginx/passwords admin admin
chown www-data /etc/nginx/passwords
chmod 600 /etc/nginx/passwords

# Load the configuration
systemctl reload nginx

