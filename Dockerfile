FROM phpmyadmin/phpmyadmin:fpm-alpine

WORKDIR /usr/share/phpmyadmin

EXPOSE 80

CMD ["php-fpm"]
