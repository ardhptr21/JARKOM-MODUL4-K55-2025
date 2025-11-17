# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush all

# Uplink ke Switch A2
ip addr add 10.91.26.98/29 dev eth0
ip link set eth0 up

# LAN A3 (Shadow)
ip addr add 10.91.24.1/23 dev eth1
ip link set eth1 up

# Default Gateway (Ke Formost)
ip route add default via 10.91.26.97

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf