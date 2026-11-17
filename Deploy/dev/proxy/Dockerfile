FROM nginx:1.30-alpine-slim

RUN apk upgrade --no-cache

COPY Deploy/dev/proxy/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]