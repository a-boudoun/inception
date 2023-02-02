FROM debian:buster

RUN apt update -y\
	&& apt install php-fpm php-mysql wget curl -y

COPY ./tools/script.sh .

ENTRYPOINT [ "/bin/sh" ]
