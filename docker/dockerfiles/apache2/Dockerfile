# Dockerfile for Apache2
#
# Details:
#   - apache2
##

# Pull base image.
FROM debian:oldstable

# Maintainer
MAINTAINER mdt <mdt@wegewerk.com>

# Install Apache2
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2\
                                                      libapache2-mod-php5 \
                                                      php5-gd
RUN a2enmod rewrite

# link sites-enabled from data-container (config)
RUN rm -rf /etc/apache2/sites-enabled
RUN ln -sf /config/apache/vhosts/ /etc/apache2/sites-enabled

EXPOSE 80

# Configure Apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /data/log/apache2
ADD error_reporting.ini /etc/php5/apache2/conf.d/

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]