FROM ubuntu:12.04
MAINTAINER Docker <tony.arianto@klola.id>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m apps && echo "apps:s1q2w3e4r5t" | chpasswd
RUN adduser apps sudo
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 supervisor
RUN apt-get -y install sudo apache2 nano proftpd curl imagemagick apache2 libapache2-mod-php5 php5-mysql php5-mcrypt php5-curl php5-imagick php5-ldap

ADD si_lib.so /usr/lib/php5/20090626
ADD si_lib.ini /etc/php5/conf.d/
RUN mv /etc/php5/apache2/php.ini /etc/php5/apache2/php_old.ini
ADD php.ini /etc/php5/apache2/
RUN mv /etc/apache2/sites-available/default /etc/apache2/sites-available/default_old
ADD default /etc/apache2/sites-available/
RUN mv /etc/proftpd/proftpd.conf /etc/proftpd/proftpd_old.conf
ADD proftpd.conf /etc/proftpd/
RUN chown -R apps:apps /home/apps

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN echo "Asia/Jakarta" > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata
EXPOSE 21 22 80
CMD ["/usr/bin/supervisord"]
