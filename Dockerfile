FROM php:7-fpm

RUN apt-get update

RUN apt-get install -y git libldap2-dev
RUN docker-php-ext-install ldap

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get install -y libz-dev libbz2-dev
RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install soap
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip bz2

RUN docker-php-ext-install sockets

RUN git config --global http.sslverify "false"
RUN cp /root/.gitconfig /var/www/.gitconfig
RUN chown www-data:www-data /var/www/.gitconfig

RUN apt-get install -y rename

RUN mkdir -p /usr/share/man/man1
RUN apt-get install -y default-jre-headless
RUN apt-get install -y pdftk
RUN apt-get install -y libreoffice

RUN apt-get install -y sendmail

RUN apt-get install -y rsync
RUN apt-get install -y default-mysql-client

RUN chmod 777 -R /var/www
