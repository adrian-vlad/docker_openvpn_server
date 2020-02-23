FROM alpine:latest

RUN apk add --update \
    openvpn \
    iptables \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* 

VOLUME ["/etc/openvpn"]

EXPOSE 49803/udp

COPY start.sh /usr/bin

CMD ["sh", "/usr/bin/start.sh"]
