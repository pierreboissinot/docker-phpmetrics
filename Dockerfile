FROM php:8.1-cli-alpine

MAINTAINER pierreboissinot <pierre.boissinot@lephare.com>

ENV PHP_METRICS_VERSION=2.8.1

RUN curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v$PHP_METRICS_VERSION/phpmetrics.phar > /usr/local/bin/phpmetrics \
    && chmod +x /usr/local/bin/phpmetrics \

    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

VOLUME ["/project"]
WORKDIR /project

ENTRYPOINT ["phpmetrics"]
CMD ["--version"]
