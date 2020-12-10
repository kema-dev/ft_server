# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdan <jjourdan@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/10 13:48:55 by jjourdan          #+#    #+#              #
#    Updated: 2020/12/10 22:51:54 by jjourdan         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt install -y php8.0-fpm wget nginx mariadb-server

COPY ./srcs/init_container.sh ./
COPY ./srcs/nginx.conf ./tmp/nginx.conf
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
COPY ./srcs/wp.config.php ./tmp/wp.config.php

CMD bash init_container.sh