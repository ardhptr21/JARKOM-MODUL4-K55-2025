# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush all

# Uplink ke Minastir (A8)
ip addr add 10.91.20.90/30 dev eth0
ip link set eth0 up

# LAN A12
ip addr add 10.91.16.1/22 dev eth1
ip link set eth1 up

# Default Gateway (Ke Minastir)
ip route add default via 10.91.20.89

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf