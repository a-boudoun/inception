#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;" > database.sql

#set root with the password 123456789
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';" >> database.sql

#Creates a user named wpuser with the password 123456789 and grants them access from any host
echo "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';" >> database.sql

#Grants all privileges on the wpdb database to the wpuser use
echo "GRANT ALL ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';" >> database.sql

#reloads the privileges from the grant tables in the MySQL database
echo "FLUSH PRIVILEGES;" >> database.sql

mysql < database.sql

kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"
