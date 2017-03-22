FROM ubuntu:14.04.4
LABEL maintainer "ali.imron@outlook.com"

ENV DEBIAN_FRONTEND noninteractive

# Install nginx, php5, php interbase/firebird module and supervisor
RUN \
  echo exit 0 > /usr/sbin/policy-rc.d && \
  chmod +x /usr/sbin/policy-rc.d && \
  apt-get update && \
  apt-get install -y nginx-light && \  
  apt-get install -y php5-fpm && \
  sed -ri 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini && \  
  apt-get install -y php5-interbase && \
  php5enmod interbase && \
  apt-get install -y supervisor && \
  mkdir -p /etc/supervisor/conf.d/ && \
  #firebird
  apt-get install -y firebird2.5-super && \
  chown -R firebird:firebird /var/lib/firebird && \
  sed -ri 's/RemoteBindAddress = localhost/RemoteBindAddress = /g' /etc/firebird/2.5/firebird.conf && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

#copy nginx - firebird config
COPY ./build/nginx/default /etc/nginx/sites-available/default
COPY ./build/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#create web VOLUME
VOLUME /usr/share/nginx/html

#create db VOLUME
VOLUME /data/zahir

# EXPOSE 80 3050
EXPOSE 80 3050

CMD ["/usr/bin/supervisord"]
# CMD ["/usr/bin/supervisord"]