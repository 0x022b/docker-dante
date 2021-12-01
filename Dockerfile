FROM alpine:3.15
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["/sbin/tini", "-g", "--", "/usr/local/bin/container-entrypoint"]
CMD ["container-daemon"]

RUN \
sed -i 's/http:/https:/' /etc/apk/repositories && \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables \
    su-exec \
    tini \
    tzdata && \
ln -s /usr/share/zoneinfo/Universal /etc/localtime

VOLUME ["/app"]

RUN \
apk add --no-cache \
    dante-server && \
deluser sockd

EXPOSE 1080/tcp
EXPOSE 1080/udp

COPY rootfs/ /
