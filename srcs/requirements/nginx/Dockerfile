FROM debian:buster

RUN apt-get update -y \
	&& apt-get install nginx openssl -y;

COPY ./tools/selfsigned /etc/ssl/

COPY ./conf/nginx.conf /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]
