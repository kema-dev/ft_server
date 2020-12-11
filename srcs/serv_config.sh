#!/bin/sh

mkdir ssl
cd ../var/www/
mkdir localhost
cd localhost
mkdir phpmyadmin
cd

echo "<?php phpinfo(); ?>" >> /var/www/localhost/index.php

cp localhost_index_on /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
rm /etc/nginx/nginx.conf
cp nginx.conf /etc/nginx/nginx.conf

cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm -f latest.tar.gz
mv wordpress/ ../var/www/localhost


wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C ../var/www/localhost/phpmyadmin/phpmyadmin.inc.php
cd ..

cd root/ssl
wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.2.0/mkcert-v1.2.0-linux-amd64
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ../..

cp wp-config.php /var/www/localhost/worpress/wp-mabite.php

service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

service nginx reload
service nginx configtest
service nginx start
service nginx status

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status

#tail -f /var/log/nginx/access.log /var/log/nginx/error.log

bash