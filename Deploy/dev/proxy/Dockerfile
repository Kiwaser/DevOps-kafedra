FROM nginx:1.29-alpine

RUN rm -f /etc/nginx/conf.d/default.conf

COPY nginx.conf      /etc/nginx/conf.d/default.conf
COPY phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

EXPOSE 80 8080

CMD ["nginx", "-g", "daemon off;"]