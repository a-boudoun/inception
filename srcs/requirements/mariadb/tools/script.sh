#!/bin/bash

service mysql start
mysql -u root -p'123456789' < /tmp/database.sql

kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"
