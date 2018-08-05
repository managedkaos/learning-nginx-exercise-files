# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx and PHP are installed and configured for you in this lesson.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -

# Update the apt cache and install MariaDB
	apt update
	apt install -y mariadb-server mariadb-client

# Once the installation is complete, check the version of MariaDB and the MariaDB service:
	mysql --version
	systemctl status mysqld.service --no-pager

# Secure the installation by running the MySQL Secure Installation comand:
	mysql_secure_installation

# Connect to the database as the root user with the mysql client.
	mysql -u root -p

# After logging in, create a demo database and an admin user with these commands:
	create database if not exists appointments;
	create user if not exists 'admin';
	grant all on appointments.* to 'admin'@'localhost' identified by 'admin';

# Log out of the root account by entering CTRL+D

# Connect to the database as the admin user:
	mysql -u admin -padmin

# View the database with a few SQL commands:
	Show databases;
	use appointments;
	Show tables;
    exit
