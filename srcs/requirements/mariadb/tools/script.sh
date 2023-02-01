#!/bin/bash

service mysql start

echo
"CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;
CREATE USER 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD';
CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';
GRANT ALL ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';
GRANT ALL ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;" >> database.sql

mysql -u root -p$ROOT_PASSWORD < database.sql

kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"
