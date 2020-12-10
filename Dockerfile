# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdan <jjourdan@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/10 13:48:55 by jjourdan          #+#    #+#              #
#    Updated: 2020/12/10 23:40:11 by jjourdan         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt install -y php7.3-fpm wget nginx mariadb-server

COPY ./srcs/init_container.sh ./

CMD bash init_container.sh