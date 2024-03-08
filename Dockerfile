FROM centos:latest
RUN echo -e "[base]\nname=CentOS-8 - Base\nbaseurl=http://mirror.centos.org/centos/8/BaseOS/x86_64/os/\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-8\nenabled=1\n" > /etc/yum.repos.d/custom.repo
MAINTAINER vikashashoke@gmail.com
RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22


# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip
#  RUN cp -rvf shine/* .
#  RUN rm -rf shine shine.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80
