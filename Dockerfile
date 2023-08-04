FROM ubuntu:latest
LABEL "Author"="Kenny"
RUN apt-get update
RUN apt-get install -y apache2 zip curl
RUN cd /var/www/html && rm index.html
RUN curl -O https://www.tooplate.com/zip-templates/2130_waso_strategy.zip
RUN unzip 2130_waso_strategy.zip
RUN cp -r 2130_waso_strategy/* /var/www/html/
#ADD 2130_waso_strategy /var/ww/html
WORKDIR /var/www/html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

