# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# NGINX is installed for you in this lesson.  Proceed with the following
# commands to explore the NGINX environment

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE

    cd /etc/nginx
    ls -l
    view /etc/nginx/nginx.conf
    view /etc/nginx/sites-available/default
    cd /var/log/nginx
    ls -l
    cd /var/www/html
    ls -l
