FROM centos:latest

RUN yum -y update && \
    yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum clean all

RUN yum install --enablerepo=remi httpd php56 php56-php php56-php-cli php56-php-common php56-php-gd php56-php-mbstring php56-php-mcrypt \
    php56-php-mysqlnd php56-php-pdo php56-php-pear php56-php-pecl-jsonc php56-php-pecl-zip php56-php-process php56-php-xml \
    php56-runtime wget tar -y

RUN wget -q -O bacula-web-latest.tgz http://www.bacula-web.org/files/bacula-web.org/downloads/bacula-web-latest.tgz && \
    tar -xzf bacula-web-latest.tgz -C /var/www/html/ && \
    chown -R apache /var/www/html/ && \
    chmod -R u=rx,g=rx,o=rx /var/www/html/ && \
    chmod -R u=rwx,g=rwx,o=rx /var/www/html/application/views/cache && \
    rm -f bacula-web-latest.tgz

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
