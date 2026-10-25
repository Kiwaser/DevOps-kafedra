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

# start-period: время на первый (долгий) запуск pgAdmin, ошибки в нём не считаются.
# start-interval: пока идёт start-period, проверяем каждые 3 секунды,
# чтобы контейнер стал healthy сразу, как только pgAdmin реально ответит.
HEALTHCHECK --interval=30s --timeout=15s --start-period=300s --start-interval=3s --retries=3 \
  CMD wget -q -T 5 -O - http://127.0.0.1:8080/misc/ping | grep -q PING \
   && wget -q -T 10 -O /dev/null http://127.0.0.1:8080/login || exit 1

ENTRYPOINT ["/entrypoint.sh"]