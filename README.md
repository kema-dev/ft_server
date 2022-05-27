# ft_server

This is a very basic introduction to [Docker](https://www.docker.com/)

Full subject is available [here](/docs)

Useful command to build and test :

```sh
docker rm mywebserv && docker build -t mywebserv . && docker run --name mywebserv -it -p 80:80 -p 443:443 mywebserv
```

phpMyAdmin's default username is "root" and no password is required

If you want to change autoindex mode :

```sh
sh ~/../tmp/autoindex_switch.sh
```

If you want to print server logs in real time:

```sh
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
```

phpinfo available @ localhost/phpproof.php
