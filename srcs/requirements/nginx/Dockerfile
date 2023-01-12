FROM debian:buster

RUN apt-get update -y;
RUN apt-get install nginx openssl -y;

COPY ./tools/nginx-selfsigned.key /etc/ssl/private/
COPY ./tools/nginx-selfsigned.crt /etc/ssl/certs/

COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/long.html /var/www/html
COPY ./tools/short.html /var/www/html


CMD ["nginx", "-g", "daemon off;"]
