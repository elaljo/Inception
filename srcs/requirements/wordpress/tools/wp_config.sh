#!/bin/bash

cd /var/www/
wp config create	--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASS \
					--dbhost=mariadb:3306 --path="/var/www/" --allow-root

wp db create --path="/var/www/" --allow-root

wp core install --url=$DOMAIN_NAME \
                --title=$TITLE \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_APASS \
                --admin_email=$WP_AEMAIL --path="/var/www/" \
                --allow-root

wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASS} --display_name=${WP_USER} --path="/var/www/" --allow-root 
/usr/sbin/php-fpm8.2 --nodaemonize