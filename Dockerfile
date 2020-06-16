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

RUN apt-get install -y wget

RUN wget https://download.documentfoundation.org/libreoffice/stable/6.4.4/deb/x86_64/LibreOffice_6.4.4_Linux_x86-64_deb.tar.gz
RUN tar zxvf LibreOffice_6.4.4_Linux_x86-64_deb.tar.gz
RUN cd LibreOffice_6.4.4.2_Linux_x86-64_deb/DEBS/ && dpkg -i *.deb
RUN rm -rf LibreOffice_6.4.4.2_Linux_x86-64_deb
RUN apt-get install -y libxinerama1 libcairo2 libsm6

RUN apt-get install -y sendmail

RUN apt-get install -y rsync
RUN apt-get install -y default-mysql-client

#RUN apt-get install -y wkhtmltopdf
RUN apt-get install -y wget

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    apt install -y ./wkhtmltox_0.12.5-1.stretch_amd64.deb

RUN chmod 777 -R /var/www

RUN ln -s /usr/local/bin/libreoffice6.4 /usr/local/bin/soffice