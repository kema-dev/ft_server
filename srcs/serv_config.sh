service mysql start

cd ..

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

mkdir /var/www/mysite && touch /var/www/mysite/index.php
echo "<?php phpinfo(); ?>" >> /var/www/mysite/index.php

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/mysite.pem -keyout /etc/ssl/mysite.key -subj "/C=FR/ST=FRANCE/L=Lyon/O=42 School/OU=jjourdan/CN=mysite"

mv ./tmp/nginx-conf /etc/nginx/sites-available/mysite
ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite
rm -rf /etc/nginx/sites-enabled/default

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mkdir /var/www/mysite/phpmyadmin
cd /tmp/
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C ../var/www/mysite/phpmyadmin &> /dev/null
echo "untar exportation muted"
rm -f phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpmyadmin.inc.php ../var/www/mysite/phpmyadmin/config.inc.php

wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz &> /dev/null
echo "untar exportation muted"
rm -f latest.tar.gz
mv wordpress/ /var/www/mysite
mv /tmp/wp-config.php /var/www/mysite/wordpress

service php7.3-fpm start
service php7.3-fpm status
service nginx reload
service nginx configtest
service nginx start
service nginx status
service mysql status

bash
