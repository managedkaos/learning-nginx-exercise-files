# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx is installed for you in this lesson.  Proceed with the following
# steps to configure a virtual host

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -
    unlink /etc/nginx/sites-enabled/default
    vim /etc/nginx/conf.d/wisdompetmed.local.conf

# Add the following into /etc/nginx/conf.d/wisdompetmed.local.conf and
# save the file

    server {
        listen 80;
        root /var/www/wisomdpetmed.local
    }

# Now continue with the following commands
    nginx -t
    systemctl reload nginx
    systemctl status nginx
    mkdir -p /var/www/wisdompetmed.local
    echo 'site coming soon' > /var/www/wisdompetmed.local/index.html

# Open the site in your browser: http://192.168.0.3

# Or use the following curl command to view the site from the CLI
    curl localhost
