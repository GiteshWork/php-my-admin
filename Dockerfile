# Use official phpMyAdmin image
FROM phpmyadmin/phpmyadmin:fpm-alpine

# Configure multiple databases
ENV PMA_HOSTS=db1.wishfin.com,db2.wishfin.com
ENV PMA_PORTS=3306,3306
ENV PMA_USER1=<db1-user>
ENV PMA_PASSWORD1=<db1-password>
ENV PMA_USER2=<db2-user>
ENV PMA_PASSWORD2=<db2-password>

# Optional: Copy custom config if needed
# COPY config.inc.php /etc/phpmyadmin/config.inc.php

# Expose port
EXPOSE 80
