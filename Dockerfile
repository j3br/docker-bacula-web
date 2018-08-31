FROM centos:latest

RUN yum install httpd php php-gd php-gettext php-pgsql php-mysql php-pdo wget tar -y

RUN wget -q http://www.bacula-web.org/files/bacula-web.org/downloads/bacula-web-latest.tgz && \
    tar -xzf bacula-web-latest.tgz -C /var/www/html/ && \
    chown -R apache /var/www/html/ && \
    chmod -R u=rx,g=rx,o=rx /var/www/html/ && \
    chmod -R u=rwx,g=rwx,o=rx /var/www/html/application/view/cache && \
    rm -f bacula-web-latest.tgz

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
