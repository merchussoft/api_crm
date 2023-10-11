FROM php:8.2-apache


RUN usermod -u 1000 www-data
WORKDIR /var/www/html/

# instalar dependencia necesaria
RUN apt update && \
    apt full-upgrade -y && \
    apt install -y \
    git \
    curl \
    zip \
    unzip

#Instalar Composer \
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar solo los archivos necesarios de Composer primero para aprovechar la caché de Docker
COPY composer.json /var/www/html/

# Instalar dependencias de Composer
RUN composer install --no-interaction --optimize-autoloader --verbose --no-cache

# Copiar archivos de la aplicacion al contenedor
COPY . /var/www/html/

# Configurar permisos y directorio del trabajo
RUN chown -R www-data:www-data /var/www/html/

# Puerto en el que el apache estara escuchando
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2-foreground"]