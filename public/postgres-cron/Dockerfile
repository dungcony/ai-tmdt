FROM postgres:17-alpine

RUN apk add --no-cache --virtual .build-deps git make gcc musl-dev clang19 llvm19 llvm19-linker-tools \
    && git clone --depth 1 https://github.com/citusdata/pg_cron.git /tmp/pg_cron \
    && cd /tmp/pg_cron \
    && make \
    && make install \
    && rm -rf /tmp/pg_cron \
    && apk del .build-deps
