FROM debian:buster

RUN apt update -y\
	&& apt install php-fpm php7.3-fpm php-mysql curl -y

COPY ./tools/script.sh /tmp/
RUN chmod 777 /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
