# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx, PHP, amd MariaDB are installed and configured for you in this lesson.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -

# Install the appointments script
    mkdir /var/www/wisdompetmed.local/appointments
    cp /vagrant/index.php /var/www/wisdompetmed.local/appointments
    chmod +r /var/www/wisdompetmed.local/appointments/index.php

# Load the appointments page in a browser: http://192.168.0.3/appointments

# Note the error message that is displayed

# (BACK IN THE VM) Insert the appointment data
    mysql -u admin -padmin appointments < /vagrant/appointment_database.sql

# Refresh the appointments page: http://192.168.0.3/appointments
