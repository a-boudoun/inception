FROM debian:buster

RUN apt update -y\
	&& apt install php-fpm php7.3-fpm php-mysql curl -y

COPY ./tools/script.sh .
RUN chmod 777 script.sh

ENTRYPOINT [ "/bin/sh" ]
# ENTRYPOINT [ "script.sh" ]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]
