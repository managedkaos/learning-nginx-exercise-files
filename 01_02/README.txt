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
    systemctl status nginx --no-pager
    systemctl start nginx
    systemctl stop nginx
    systemctl is-active nginx
    systemctl start nginx
    systemctl is-active nginx
    systemctl reload nginx
    nginx -h
    nginx -t
    nginx -T
    nginx -T | less
