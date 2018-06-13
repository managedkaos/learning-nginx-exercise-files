# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx is installed and configured for you in this lesson.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -
    apt-get install -y unzip
    unzip /vagrant/Wisdom_Pet_Medicine_responsive_website_LYNDA_12773.zip -d /var/www/wisdompetmed.local
    find /var/www/wisdompetmed.local -type f -exec chmod 644 {} \; -print
    find /var/www/wisdompetmed.local -type d -exec chmod 755 {} \; -print

# Open the site in your browser: http://192.168.0.3

# Or use the following curl command to view the site from the CLI
    curl localhost
