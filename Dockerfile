
# Use CentOS 10 base image
FROM quay.io/centos/centos:10

# Install Apache HTTP Server
RUN yum -y install httpd && yum clean all

# Expose HTTP port
EXPOSE 80

# Create a simple welcome page
RUN echo "Welcome to Docker Lesson" > /var/www/html/index.html

# Start Apache in foreground
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
