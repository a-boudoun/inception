FROM debian:buster

RUN apt update -y
RUN apt install php-fpm php-mysql -y
RUN apt install wget curl -y

COPY ./tools/script.sh .

ENTRYPOINT [ "/bin/sh" ]
