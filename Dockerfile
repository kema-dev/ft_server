FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install wget \
																php7.3-fpm \
																php7.3-mysql \
																nginx \
																mariadb-server \
																vim

COPY srcs ./tmp

WORKDIR /tmp/

ENTRYPOINT ["bash", "serv_config.sh"]