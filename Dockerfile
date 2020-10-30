FROM alpine:3.12
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/container-entrypoint"]
CMD ["container-daemon"]

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables \
    tini

VOLUME ["/app"]

RUN \
apk add --no-cache \
    dante-server

EXPOSE 1080/tcp
EXPOSE 1080/udp

COPY rootfs/ /
