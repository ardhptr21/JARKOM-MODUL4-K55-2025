ip addr flush dev eth0; ip route flush all
ip addr add 10.91.20.3/26 dev eth0; ip link set eth0 up
ip route add default via 10.91.20.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf