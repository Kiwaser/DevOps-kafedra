FROM dpage/pgadmin4:9.18.0 AS base

USER root

RUN apk upgrade --no-cache \
 && apk upgrade --no-cache -X https://dl-cdn.alpinelinux.org/alpine/edge/main curl libcurl \
 && apk del --no-cache sudo \
 && rm -rf /etc/sudoers.d \
 && pip --python /venv/bin/python3 install --no-cache-dir --upgrade \
      "pillow>=13.0.0" "brotli>=1.2.1" "certifi>=2026.10.19" "urllib3>=2.8.0" \
 && pip uninstall -y pip \
 && rm -rf /usr/local/lib/python3.14/ensurepip/_bundled /root/.cache

FROM scratch

COPY --from=base / /

ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin \
    PYTHON_VERSION=3.14.7 \
    PYTHONPATH=/pgadmin4 \
    PGADMIN_LISTEN_PORT=8080 \
    PGADMIN_DISABLE_POSTFIX=1 \
    PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False

WORKDIR /pgadmin4

USER pgadmin

VOLUME /var/lib/pgadmin

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=15s --start-period=300s --start-interval=3s --retries=3 \
  CMD wget -q -T 5 -O - http://127.0.0.1:8080/misc/ping | grep -q PING \
   && wget -q -T 10 -O /dev/null http://127.0.0.1:8080/login || exit 1

ENTRYPOINT ["/entrypoint.sh"]