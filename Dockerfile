# Use official phpMyAdmin lightweight image
FROM phpmyadmin/phpmyadmin:latest

# Optional: Set fallback defaults (can be overridden by Kubernetes envs)
ENV PMA_HOSTS=db1.wishfin.com,db2.wishfin.com
ENV PMA_PORTS=3306,3306
ENV PMA_USER1=
ENV PMA_PASSWORD1=
ENV PMA_USER2=
ENV PMA_PASSWORD2=

# Expose port used by phpMyAdmin
EXPOSE 80

# The official image already includes the CMD to start PHP-FPM
# so you don’t need to override ENTRYPOINT or CMD
