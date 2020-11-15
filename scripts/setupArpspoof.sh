#! /bin/sh

port=8080

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port $port
iptables -I INPUT -p tcp --dport $port -j ACCEPT
