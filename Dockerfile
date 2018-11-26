FROM alpine:3.8
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["docker-entrypoint"]
CMD ["container-daemon"]
VOLUME ["/app"]

RUN \
echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
>> '/etc/apk/repositories' && \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    dante-server@testing \
    iptables \
    ip6tables \
    su-exec && \
deluser sockd

COPY rootfs/ /
