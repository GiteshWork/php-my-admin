# Use official phpMyAdmin lightweight image
FROM phpmyadmin/phpmyadmin:5.2.2

# Optional: Set fallback defaults (can be overridden by Kubernetes envs)

# Expose port used by phpMyAdmin
EXPOSE 80

# The official image already includes the CMD to start PHP-FPM
# so you don’t need to override ENTRYPOINT or CMD
