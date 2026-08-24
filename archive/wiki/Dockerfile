# FROM php:8.2-apache
FROM php:apache

# install extensions

RUN set -ex && \
    ( curl -sSLf https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - || echo 'return 1' ) | sh -s \
    json mbstring zip intl gd  # fpm

# config
RUN set -ex && \
    a2enmod rewrite

# Set entrypoint

# commands
#docker run  \
#    -d  \
#    -p 19652:80 \
#    --name wiki \
#    --user 1000:1000 \
#    --restart unless-stopped \
#    -v /home/kuma/data/doku:/var/www/html \
#    -v /home/kuma/data/config/apache2/apache2.conf:/etc/apache2/apache2.conf \
#    kumatea/wiki
