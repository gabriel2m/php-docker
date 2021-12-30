FROM php:7.4-fpm-alpine

RUN apk update --no-cache \
    && apk add --no-cache \
    git \
    zip \
    unzip \
    libpng-dev \
    icu-dev \
    libzip-dev \
    autoconf \
    g++ \
    make

RUN docker-php-ext-install pdo_mysql intl gd zip

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
