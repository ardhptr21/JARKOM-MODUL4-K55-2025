# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3
ip route flush all

# Interface Internet (NAT)
ip addr add 192.168.122.50/24 dev eth0
ip link set eth0 up
ip route add default via 192.168.122.1

# Interface ke Eregion (Subnet A13)
ip addr add 10.91.9.17/30 dev eth3
ip link set eth3 up

# Routing ke Seluruh Sayap Bawah
ip route add 10.91.0.0/20 via 10.91.9.18

# NAT & DNS
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo "nameserver 8.8.8.8" > /etc/resolv.conf