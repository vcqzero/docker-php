# Dockerfile
FROM php:7.4-fpm

# Add start.sh
ADD start.sh /

# 添加php.ini文件
COPY php.ini-development /usr/local/etc/php/php.ini

# Install Zip Vim Ps
RUN apt-get update && apt-get install -y zip \
    && apt-get install -y vim \
    && apt-get install -y procps 
RUN chmod +x /start.sh
# 安装nginx
RUN apt-get update && apt-get install -y nginx
# gd
RUN apt-get update && apt-get install -y \ 
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd 
RUN docker-php-ext-install -j$(nproc) pdo_mysql
# bcmath
RUN docker-php-ext-install -j$(nproc) bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 
# composer config repo.packagist composer https://packagist.phpcomposer.com

# 声明nginx配置文件挂载到容器中
VOLUME [ "/etc/nginx/sites-enabled", "/var/www" ]

# 定义需要暴露的接口
# 8000:80
EXPOSE 80 