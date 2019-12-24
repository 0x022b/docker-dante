FROM alpine:3.11
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["docker-entrypoint"]
CMD ["container-daemon"]
VOLUME ["/app"]

EXPOSE 1080/tcp
EXPOSE 1080/udp

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
