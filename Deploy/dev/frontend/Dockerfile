FROM node:26.13.1-alpine3.24

RUN apk upgrade --no-cache \
 && npm install -g npm@latest \
 && npm cache clean --force \
 && rm -rf /var/cache/apk/*

WORKDIR /app

COPY --chmod=0755 Deploy/dev/frontend/entrypoint.sh /usr/local/bin/entrypoint.sh

USER node

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]