# Dockerfile for Apache2
#
# Details:
#   - apache2
##

# Pull base image.
#FROM debian:oldstable
FROM debian:stable

# Maintainer
MAINTAINER mdt <mdt@wegewerk.com>

# Install Apache2
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2\
                                                      libapache2-mod-php5 \
                                                      php5-gd php5-curl \
                                                      php5-mysql php5-intl
RUN a2enmod rewrite

# add single vhosts file
RUN rm -rf /etc/apache2/sites-enabled/*
ADD  vhost.conf /etc/apache2/sites-enabled

EXPOSE 80

# Configure Apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /data/statthaus-app/var/log/apache2/
ADD error_reporting.ini /etc/php5/apache2/conf.d/
ADD envvars /etc/apache2/

# only needed if FROM debian:stable
ADD apache2.conf /etc/apache2/

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]