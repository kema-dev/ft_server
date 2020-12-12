My 42 Lyon's ft_server project !

Useful command to build and test :

docker rm mywebserv && docker build -t mywebserv . && docker run --name mywebserv -it -p 80:80 -p 443:443 mywebserv

phpMyAdmin's default username is "root" and no password is required

If you want to change autoindex mode :

- vim /etc/nginx/sites-available/mysite/nginx.conf
- replace autoindex "X" with "on" / "off" on line 21
- service nginx reload
- service nginx restart
- service nginx status

done !

If you want to real-time print server logs :

tail -f /var/log/nginx/access.log /var/log/nginx/error.log

Useful sources :

https://github.com/pmouhali/ft_server

https://github.com/rchallie/ft_server

My student address : jjourdan@student.42lyon.fr