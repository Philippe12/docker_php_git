FROM php:7-fpm

RUN apt-get update && apt-get install -y git\
          libldap2-dev
RUN docker-php-ext-install ldap

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && apt-get install -y libz-dev libbz2-dev
RUN docker-php-ext-install zip bz2
    
RUN git config --global http.sslverify "false"

RUN apt-get update && apt-get install -y rename

RUN apt-get update && apt-get install pdftk
RUN apt-get update && apt-get install -y libreoffice

COPY php.ini /usr/local/etc/php/php.ini
