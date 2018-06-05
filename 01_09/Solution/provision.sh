# Update the package references
apt update

# Install nginx, php, mariadb, and elinks
apt install -y nginx

# Remove the default configuration
unlink /etc/nginx/sites-enabled/default

# Install the new configuration
cp /home/vagrant/wisdompetmed.local.conf /etc/nginx/conf.d

# Install the demo site
mkdir /var/www/wisomdpetmed.local
echo "site goes here" > /var/www/wisomdpetmed.local/index.html

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
