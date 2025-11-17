ip addr flush dev eth0; ip route flush all
ip addr add 10.91.26.67/27 dev eth0; ip link set eth0 up
ip route add default via 10.91.26.65
echo "nameserver 8.8.8.8" > /etc/resolv.conf