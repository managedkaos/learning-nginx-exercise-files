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
