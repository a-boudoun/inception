#!/bin/bash

#MARIADB
WP_DB_HOST=mariadb
WP_DB_NAME=wpdb
ROOT_PASSWORD=123456789
WP_DB_USER=wpuser
WP_DB_PASSWORD=987654321
#wordpress
DOMAIN=aboudoun.42.fr
WP_USER=abderrahim
WP_USER_PASSWORD=abderrahim@1337
WP_USER_EMAIL=abderrahim@gmail.com
WP_ADMIN=dahmad
WP_ADMIN_PASSWORD=dahmad@42
WP_ADMIN_EMAIL=dahmad@gmail.com
# how install wordpress https://wordpress.org/documentation/article/how-to-install-wordpress/#step-3-set-up-wp-config-php

#installing wordpress int the the root directory for web server
mkdir -p /var/www/html
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

#configure wp-vonfig.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/$WP_DB_NAME/" wp-config.php
sed -i "s/username_here/$WP_DB_USER/" wp-config.php
sed -i "s/password_here/$WP_DB_PASSWORD/" wp-config.php
sed -i "s/localhost/$WP_DB_HOST/" wp-config.php

#installing wordpress site using wp-cli https://developer.wordpress.org/cli/commands/core/install/
#and creating admin and user
wp core install --allow-root --url=$DOMAIN --title=Example --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email
wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --skip-email

# change /run/php/php7.3-fpm.sock to TCP/IP port 9000 .
sed -i "36 s/\/run\/php\/php7.3-fpm.sock/9000/" /etc/php/7.3/fpm/pool.d/www.conf
#execute /usr/sbin/php-fpm7.3 -F to run int he foreground
exec "$@"

