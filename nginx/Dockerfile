FROM ubuntu:bionic
LABEL version=0.0.2
LABEL maintainer="Assis Ngolo <figassis@gmail.com>"


ENV DEBIAN_FRONTEND=noninteractive \
  NGINX_CONF_DIR=/etc/nginx

# Install useful packages
RUN apt-get update && apt-get -y install --no-install-recommends -y curl wget vim sudo nginx

RUN	rm -rf /var/www/* /etc/nginx/sites-enabled/* && mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html -Rf

# Place configuration files
COPY ./nginx.conf ${NGINX_CONF_DIR}/nginx.conf
COPY ./wprocket.conf ${NGINX_CONF_DIR}/wprocket.conf
COPY ./wordpress.conf ${NGINX_CONF_DIR}/sites-available/default.conf

RUN ln -s ${NGINX_CONF_DIR}/sites-available/default.conf ${NGINX_CONF_DIR}/sites-enabled/default.conf

EXPOSE 80
WORKDIR /var/www/html
CMD ["/usr/sbin/nginx"]
