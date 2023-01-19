FROM debian:buster

RUN apt-get update -y \
	&& apt-get install nginx openssl -y;

COPY ./tools/selfsigned /etc/ssl/

COPY ./conf/nginx.conf /etc/nginx/

#for testing
COPY ./tools/short.html /var/www/html

CMD ["nginx", "-g", "daemon off;"]
