# Use the nginx.conf file in this directory for this lesson.

# Or if you would like to look at nginx.conf with Nginx installed..

# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -
    apt update
    apt upgrade -y # this step is optional
    apt install nginx -y
    nginx -v
    systemctl status nginx
    view /etc/nginx/nginx.conf
