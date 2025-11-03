# Start from PHP with Apache
FROM php:8.2-apache

# Set environment variables for phpMyAdmin version
ENV PHPMYADMIN_VERSION 5.2.1

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Download and install phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.zip -O /tmp/phpmyadmin.zip \
    && unzip /tmp/phpmyadmin.zip -d /usr/share/ \
    && mv /usr/share/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages /usr/share/phpmyadmin \
    && rm /tmp/phpmyadmin.zip

# Configure Apache
RUN chown -R www-data:www-data /usr/share/phpmyadmin
COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY stage-config.inc.php /usr/share/phpmyadmin/config.inc.php
RUN chmod 755 /usr/share/phpmyadmin/config.inc.php

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
