# Update the package references
apt-get update

# Install nginx, php, mariadb, and elinks
apt-get install -y nginx unzip

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /home/vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisdomdpetmed.local
mkdir /var/www/wisdomdpetmed.local/images

echo "site goes here" > /var/www/wisdomdpetmed.local/index.html
echo "error page goes here" > /var/www/wisdomdpetmed.local/404.html

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
