FROM postgres:17.11-alpine3.24 AS base

RUN apk upgrade --no-cache \
 && apk add --no-cache su-exec \
 && rm /usr/local/bin/gosu \
 && ln -s /sbin/su-exec /usr/local/bin/gosu

FROM scratch

COPY --from=base / /

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=en_US.utf8 \
    PG_MAJOR=17 \
    PG_VERSION=17.11 \
    PGDATA=/var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

STOPSIGNAL SIGINT

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --start-interval=2s --retries=5 \
  CMD pg_isready -h 127.0.0.1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" || exit 1

EXPOSE 5432

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["postgres"]