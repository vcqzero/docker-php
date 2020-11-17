# Dockerfile
FROM php:7.4-fpm

# 添加php.ini文件
COPY php.ini-development /usr/local/etc/php/php.ini

# Install Zip Vim Ps
RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && rm -Rf /var/lib/apt/lists/* &&  cat /etc/apt/sources.list
RUN apt-get update && apt-get install -y zip \
    # && apt-get install -y vim \
    && apt-get install -y procps 
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

# php-fpm端口9000
EXPOSE 9000