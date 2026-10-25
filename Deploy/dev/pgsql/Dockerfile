FROM postgres:17.11-alpine3.24

RUN apk upgrade --no-cache \
 && apk add --no-cache su-exec \
 && rm /usr/local/bin/gosu \
 && ln -s /sbin/su-exec /usr/local/bin/gosu

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --start-interval=2s --retries=5 \
  CMD pg_isready -h 127.0.0.1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" || exit 1

EXPOSE 5432