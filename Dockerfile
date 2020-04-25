ARG APACHE_VERSION=""
FROM httpd:${APACHE_VERSION:+${APACHE_VERSION}-}alpine

RUN apk update; \
    apk upgrade;

# Include script to set Wordpress file persmissions
COPY wppermissions.sh /usr/sbin/wppermissions
RUN chmod +x /usr/sbin/wppermissions

# Copy apache vhost file to proxy php requests to php-fpm container
COPY apache.conf /usr/local/apache2/conf/default.apache.conf
RUN echo "Include /usr/local/apache2/conf/default.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf
