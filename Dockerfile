FROM php:8.1-cli-alpine

MAINTAINER pierreboissinot <pierre.boissinot@lephare.com>

ENV PHP_METRICS_VERSION=2.8.1

# @link https://stackoverflow.com/questions/44097266/add-yaml-extension-to-php-on-using-official-alpine-docker-image
ENV PHPIZE_DEPS \
    git \
    file \
    re2c \
    autoconf \
    make \
    zlib \
    zlib-dev \
    g++ \
    yaml-dev

RUN set -xe; \
    apk add --update --no-cache --virtual .build-deps ${PHPIZE_DEPS}; \
    echo '@community http://nl.alpinelinux.org/alpine/v3.7/community/' >> /etc/apk/repositories;

RUN pecl install yaml && \
    docker-php-ext-enable yaml

RUN curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v$PHP_METRICS_VERSION/phpmetrics.phar > /usr/local/bin/phpmetrics \
    && chmod +x /usr/local/bin/phpmetrics \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

VOLUME ["/project"]
WORKDIR /project

ENTRYPOINT ["phpmetrics"]
CMD ["--version"]
