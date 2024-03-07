FROM centos:8
#MAINTAINER varadharajan69@gmail.com
FROM centos:8
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's/http:\/\/mirror\.centos\.org/https:\/\/mirrors.aliyun.com/g' /etc/yum.repos.d/CentOS-*.repo
RUN yum install -y \
    httpd \
    zip \
    unzip \
&& yum clean all
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
