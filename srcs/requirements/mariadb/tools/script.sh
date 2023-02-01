#!/bin/bash

WP_DB_NAME=wpdb
ROOT_PASSWORD=123456789
WP_DB_USER=wpuser
WP_DB_PASSWORD=987654321

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;" > database.sql
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD';" >> database.sql
echo "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';" >> database.sql
echo "GRANT ALL ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';" >> database.sql
echo "GRANT ALL ON *.* TO 'root'@'%';" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysql -u root -p$ROOT_PASSWORD < database.sql

kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"
