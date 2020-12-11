# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdan <jjourdan@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/10 13:48:55 by jjourdan          #+#    #+#              #
#    Updated: 2020/12/11 19:08:20 by jjourdan         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install mariadb-server \
												wget \
												php \
												php-cli \
												php-cgi \
												php-mbstring \
												php-fpm \
												php-mysql \
												nginx \
												libnss3-tools

COPY srcs ./root/

WORKDIR /root/

ENTRYPOINT ["bash", "serv_config.sh"]