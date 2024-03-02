FROM ubuntu:22.04
RUN apt update -y && apt install nginx -y
WORKDIR /var/www/html
RUN mkdir ./es
COPY ./l0k1.es/build/* .
COPY ./l0k1.es-es/build/* ./es
RUN chmod +x ./*
RUN chmod +x ./es/*
COPY ./.docker/nginx.conf /etc/nginx/nginx.conf
CMD service nginx start && bash
# EXPOSE 80 443