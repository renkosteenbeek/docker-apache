ARG APACHE_VERSION=""
FROM httpd:2.4-alpine

RUN apk update; \
    apk upgrade;

# Include script to set Wordpress file persmissions
COPY wppermissions.sh /usr/sbin/wppermissions
RUN chmod +x /usr/sbin/wppermissions

# set the default name of the php container
ENV PHPCONTAINER php

# Copy apache vhost file to proxy php requests to php-fpm container
COPY default.apache.conf /usr/local/apache2/conf/default.apache.conf
RUN echo "Include /usr/local/apache2/conf/default.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf
