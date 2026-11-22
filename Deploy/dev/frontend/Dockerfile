FROM node:26.13.1-alpine3.24 AS base

RUN apk upgrade --no-cache \
 && npm install -g npm@11.21.3 \
 && npm cache clean --force \
 && rm -rf /var/cache/apk/*

FROM base AS final

WORKDIR /app

COPY --chmod=0755 Deploy/dev/frontend/entrypoint.sh /usr/local/bin/entrypoint.sh

USER node

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]