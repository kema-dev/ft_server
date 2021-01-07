echo -e "\nstarting autoindex switch ...\n"

if cat /etc/nginx/sites-available/mysite | grep " on"
	then cat /tmp/nginx-conf-on > /etc/nginx/sites-available/mysite
	else cat /tmp/nginx-conf-off > /etc/nginx/sites-available/mysite
fi

echo -e "\nautoindex switch finished\n"