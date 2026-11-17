FROM node:26.13.1-alpine3.24

WORKDIR /app

COPY --chmod=0755 Deploy/prod/frontend/entrypoint.sh /usr/local/bin/entrypoint.sh

USER node

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]