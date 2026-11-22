FROM php:8.5-fpm-alpine3.24 AS builder

RUN apk add --no-cache postgresql-dev \
 && docker-php-ext-install pdo_pgsql

FROM php:8.5-fpm-alpine3.24 AS final

RUN apk add --no-cache --upgrade \
      'musl=1.2.6-r3' \
      'musl-utils=1.2.6-r3' \
      'openssl=3.5.9-r1' \
      'libxml2=2.13.9-r3' \
      'sqlite-libs=3.53.4-r0' \
      'libpq=18.7-r0' \
 && apk del --no-cache tar

COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=builder /usr/local/etc/php/conf.d/docker-php-ext-pdo_pgsql.ini /usr/local/etc/php/conf.d/

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

USER www-data