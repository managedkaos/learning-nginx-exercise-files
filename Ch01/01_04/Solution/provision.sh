# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx

# Load the configuration
systemctl reload nginx

