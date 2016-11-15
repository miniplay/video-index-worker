FROM centos:6.8
MAINTAINER Rafael de Elvira <rafa@minijuegos.com>

# EPEL + START UPDATE
RUN yum -y install epel-release
RUN yum clean all
RUN yum -y update

# REMI REPO FOR PHP
RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-6.rpm
RUN yum -y --enablerepo=remi,remi-test install php70 php70-php-mysqlnd php70-php-gd php70-php-cli php70-php-common php70-php-devel php70-php-pdo php70-php-intl php70-php-mbstring php70-php-mcrypt php70-php-opcache php70-php-fpm php70-php-pecl-gearman php70-php-pecl-geoip php70-php-pecl-redis php70-php-pecl-zip php70-php-phpiredis php70-php-soap php70-php-xml php70-php-tidy
RUN yum -y update
RUN ln -s /usr/bin/php70 /usr/bin/php

# GEARMAN
RUN yum -y install gearmand.x86_64 libgearman.x86_64 libgearman-devel.x86_64


RUN mkdir -p /opt/miniproject
RUN mkdir -p /opt/script
COPY ./script /opt/script
RUN chmod -R +x /opt/script
RUN chmod 770 /etc/hosts
CMD ["/opt/script/run.sh"]
