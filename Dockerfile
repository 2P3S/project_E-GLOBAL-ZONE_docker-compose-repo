FROM php:7.2-fpm-alpine

RUN apk add --no-cache zip libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql
# RUN docker-php-ext-install pdo pdo_mysql zip

# Copy scheduler_crontab.conf file to the crontabs directory
COPY scheduler_crontab.conf /etc/crontabs

# Apply cron job
RUN crontab /etc/crontabs/scheduler_crontab.conf
