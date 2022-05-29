FROM wordpress:php7.1-apache
WORKDIR /usr/src/wordpress
COPY . /var/www/html
EXPOSE 80
