FROM nginx:1.30-alpine-slim AS base

RUN apk upgrade --no-cache

FROM base AS final

COPY Deploy/prod/proxy/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]