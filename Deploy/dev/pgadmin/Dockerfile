FROM dpage/pgadmin4:9.18.0

USER root

ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin \
    PYTHONPATH=/pgadmin4 \
    PGADMIN_LISTEN_PORT=8080 \
    PGADMIN_DISABLE_POSTFIX=1 \
    PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False

WORKDIR /pgadmin4

USER pgadmin

VOLUME /var/lib/pgadmin

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/misc/ping || exit 1

ENTRYPOINT ["/entrypoint.sh"]