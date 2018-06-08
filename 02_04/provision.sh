# Update the package references
apt-get update

# Install nginx, php, mariadb, and elinks
apt-get install -y nginx unzip php-fpm php-mysql mariadb-server mariadb-client

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisdomdpetmed.local
unzip /vagrant/Wisdom_Pet_Medicine_responsive_website_LYNDA_12773.zip -d /var/www/wisdomdpetmed.local
find /var/www/wisdomdpetmed.local -type f -exec chmod 644 {} \; -print
find /var/www/wisdomdpetmed.local -type d -exec chmod 755 {} \; -print

# Install a php info script
cp /vagrant/info.php /var/www/wisdomdpetmed.local
chmod +r /var/www/wisdomdpetmed.local/info.php

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

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
