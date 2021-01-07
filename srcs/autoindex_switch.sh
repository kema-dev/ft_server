echo -e "\nstarting autoindex switch ...\n"

cp ./tmp/nginx-conf-on /etc/nginx/sites-available/tmp_mysite
cp ./tmp/nginx-conf-off /etc/nginx/sites-available/tmp_mysite
cp ./tmp/nginx-conf-on /etc/nginx/sites-available/tmp_mysite

echo -e "\nautoinde switch finished\n"