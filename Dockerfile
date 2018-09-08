
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php libapache2-mod-php php-xml
RUN apt-get install -y php7.0
RUN apt-get install -y php-mbstring
RUN apt-get install -y php7.0-xml
RUN apt-get install -y wget
RUN a2enmod rewrite

WORKDIR /var/www/html

RUN wget https://download.dokuwiki.org/out/dokuwiki-8a269cc015a64b40e4c918699f1e1142.tgz
RUN tar -xvzf dokuwiki-8a269cc015a64b40e4c918699f1e1142.tgz
RUN rm dokuwiki-8a269cc015a64b40e4c918699f1e1142.tgz
RUN  mv dokuwiki-*/* /var/www/html 

#RUN --chown=www-data:www-data ./dokuwiki/ /var/www/html
RUN chown -R www-data:www-data ./dokuwiki/ /var/www/html
RUN nano /etc/apache2/sites-enabled/000*.conf

RUN service apache2 start

EXPOSE 80


