# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    README.md                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdan <jjourdan@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/12 00:41:38 by jjourdan          #+#    #+#              #
#             let's code !                            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

Useful command to build and test :

docker rm mywebserv && docker build -t mywebserv . && docker run --name mywebserv -it -p 80:80 -p 443:443 mywebserv

If you want to remove autoindex :

- vim /etc/nginx/sites-available/mysite/nginx.conf
- replace autoindex "X" with "on" / "off" line 22
- service nginx reload
- service nginx restart
- service nginx status

done !

If you want to real-time print server logs :

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
