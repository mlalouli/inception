#!/bin/bash

DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASS=$DB_PASS

service php7.3-fpm restart

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

cp wp-config-sample.php wp-config.php

wp config set DB_HOST mariadb --type=constant --allow-root

wp config set DB_NAME $DB_NAME --type=constant --allow-root

wp config set DB_USER $DB_USER --type=constant --allow-root

wp config set DB_PASSWORD $DB_PASS --type=constant --allow-root

wp core install --url=localhost --title="My WordPress Site" --admin_user=mlalouli --admin_password=mlalouli --admin_email=mlalouli@gmail.com --skip-email --allow-root
wp user create asmaa asmaa123@gmail.com --role=subscriber --user_pass=asmaa123 --allow-root
wp user create yousra yousra123@gmail.com --role=subscriber --user_pass=yousra123 --allow-root

/usr/sbin/php-fpm7.3 -F  