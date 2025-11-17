# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip route flush all

# Uplink ke Switch A2
ip addr add 10.91.26.99/29 dev eth0
ip link set eth0 up

# LAN A4 (Doriath) -> eth1
ip addr add 10.91.26.65/27 dev eth1
ip link set eth1 up

# LAN A5 (Imrahil) -> eth2
ip addr add 10.91.26.1/26 dev eth2
ip link set eth2 up

# Default Gateway (Ke Formost)
ip route add default via 10.91.26.97

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf