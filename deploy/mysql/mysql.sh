#!/bin/bash

# add root user to specific IP to differentiate between vagrant boxes #
mysql -uroot -pTest1234 -e "CREATE USER 'root'@'%' IDENTIFIED BY 'Test1234';"
mysql -uroot -pTest1234 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

# create promo2016 db #
mysql -uroot -pTest1234 -e "CREATE DATABASE profile_website CHARSET utf8 COLLATE utf8_unicode_ci;"

# add permissions to root for tables #
mysql -uroot -pTest1234 -e "GRANT ALL PRIVILEGES ON profile_website.* TO 'root'@'localhost';"

# change mysql config  #
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/max_allowed_packet.*/max_allowed_packet = 128M/" /etc/mysql/mysql.conf.d/mysqld.cnf
