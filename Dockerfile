FROM php:7.2-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

# Copy scheduler_crontab.conf file to the crontabs directory
COPY scheduler_crontab.conf /etc/crontabs

# Apply cron job
RUN crontab /etc/crontabs/scheduler_crontab.conf
