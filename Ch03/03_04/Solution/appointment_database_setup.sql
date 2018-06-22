create database if not exists appointments;
create user if not exists 'admin';
grant all on appointments.* to 'admin'@'localhost' identified by 'admin';
