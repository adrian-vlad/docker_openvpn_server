#!/bin/sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200

SERVER=192.168.255.0/24
IFACE=eth0

iptables -t nat -C POSTROUTING -s ${SERVER} -o ${IFACE} -j MASQUERADE || {
  iptables -t nat -A POSTROUTING -s ${SERVER} -o ${IFACE} -j MASQUERADE
}

exec "/usr/sbin/openvpn" "--cd" "/etc/openvpn" "--config" "/etc/openvpn/server.conf"
