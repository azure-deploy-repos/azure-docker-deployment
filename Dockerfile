ARG baseimageversion=10
FROM quay.io/centos/centos:${baseimageversion}
RUN yum -y install httpd unzip
ARG APP_VERSION=1.0.0
ENV APP_VERSION=${APP_VERSION}
EXPOSE 80
ADD templatemo_634_lantern_river.zip /opt
WORKDIR /opt
RUN unzip templatemo_634_lantern_river.zip
RUN cp -r templatemo_634_lantern_river/* /var/www/html/
RUN chown -R apache:apache /var/www/html/
RUN chown -R apache:apache /etc/httpd/logs/ /run/httpd
RUN echo "ServerName localhost" >>/etc/httpd/conf/httpd.conf
USER apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]