# SPECIFY OPERATING SYSTEM
FROM debian:buster

ENV AUTOINDEX on

# INSTALL UPDATES
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get -y install wget

# INSTALL NGINX, MARIA-DB, PHP
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

# INSTALL WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update && wp core download --path=/var/www/html/wordpress --locale=nl_NL --allow-root

# INSTALL PHPMYADMIN IN HTML FOLDER
WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz; \
    tar -xf phpMyAdmin-5.0.4-english.tar.gz && rm -rf phpMyAdmin-5.0.4-english.tar.gz; \
    mv phpMyAdmin-5.0.4-english phpmyadmin

# COPY CONFIG FILES
COPY ./srcs/nginx/*.conf /tmp/
#COPY ./srcs/nginx/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/mysql/mysql.sql /var/
COPY ./srcs/phpmyadmin/config.inc.php /var/www/html/phpmyadmin
COPY ./srcs/phpmyadmin/create_tables.sql /var/www/html/phpmyadmin/sql
COPY ./srcs/wordpress/wp-config.php /var/www/html/wordpress/

RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/; \
    service mysql start && mysql -u root mysql < /var/mysql.sql; \
    mysql -u root mysql < /var/www/html/phpmyadmin/sql/create_tables.sql

#SSL CERTIFICATE SETTING
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/certs/localhost.key -subj "/C=NL/ST=Utrecht/L=Utrecht/O=Codam/OU=aheister/CN=mysite"; \
    chown -R www-data:www-data /var/www/*; \
    chmod -R 755 /var/www/*

RUN service mysql start \
    && wp core install --url=http://localhost/wordpress --title=mysite --admin_user=aheister --admin_password=test1234 --admin_email=anna@heister.nl --quiet --path=/var/www/html/wordpress --allow-root \
    && wp theme install twentytwenty --quiet --activate --path=/var/www/html/wordpress --allow-root

# Scripts: change_index.sh
COPY srcs/change_autoindex.sh ./
RUN bash change_autoindex.sh
CMD service mysql start; service nginx start; service php7.3-fpm start; bash

EXPOSE 80 443