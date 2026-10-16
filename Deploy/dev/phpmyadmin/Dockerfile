FROM phpmyadmin:5.2.3-fpm-alpine

ENV PMA_HOST=mysql \
    PMA_PORT=3306 \
    UPLOAD_LIMIT=64M \
    MAX_EXECUTION_TIME=600

COPY php.ini /usr/local/etc/php/conf.d/zz-phpmyadmin.ini

EXPOSE 9000