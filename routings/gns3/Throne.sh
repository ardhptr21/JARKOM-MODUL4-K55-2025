# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush all

# Uplink ke Switch A9
ip addr add 10.91.20.67/29 dev eth0
ip link set eth0 up

# LAN A11
ip addr add 10.91.20.73/29 dev eth1
ip link set eth1 up

# Default Gateway (Ke Amroth)
ip route add default via 10.91.20.65

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf