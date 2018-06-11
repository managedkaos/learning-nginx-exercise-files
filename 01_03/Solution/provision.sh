# Update the package references
apt-get update

# Install nginx, php, mariadb, and elinks
apt-get install -y nginx

# Restart and check the status of everything
systemctl restart nginx
systemctl status nginx.service --no-pager
