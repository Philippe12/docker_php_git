FROM php:7-fpm

RUN apt-get update && apt-get install -y git\
          libldap2-dev

RUN docker-php-ext-install ldap
RUN docker-php-ext-install pdo pdo_mysql

#RUN echo session.save_path = "/sessions/" >> /usr/local/etc/php-fpm.d/docker.conf
