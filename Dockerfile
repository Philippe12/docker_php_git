FROM php:7-fpm

RUN apt-get update && apt-get install -y git\
          libldap2-dev

RUN docker-php-ext-install ldap
RUN docker-php-ext-install pdo pdo_mysql
