FROM php:7.4-apache

#
# PHP Configuration
#
# install PHP modules
# ----------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
          libzip-dev \
          wget \
          zip \
          unzip \
          sudo \
          git \
          imagemagick \
          perlmagick \
          libdbi-perl \
          libdbd-mysql-perl \
          libcache-memcached-perl \
          libgd-perl \
          libimager-perl \
          libipc-run-perl \
          libarchive-zip-perl \
          libxml-atom-perl \
          libxml-sax-expatxs-perl \
          libyaml-syck-perl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install opcache


# install GD
# ----------
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-webp=/usr/include/ \
    && docker-php-ext-install gd


# install Imagemagick & PHP Imagick ext
# ----------
RUN apt-get install -y --no-install-recommends \
        libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick


# install Xdebug
# ----------
RUN pecl install xdebug \
      && docker-php-ext-enable xdebug


# cleanup
# ----------
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# enable cgi / mod_rewite
# ----------
RUN a2enmod cgi
RUN a2enmod rewrite


# install composer
# ----------
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
