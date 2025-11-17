# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush all

# Uplink ke Minastir (A7)
ip addr add 10.91.20.86/30 dev eth0
ip link set eth0 up

# Downlink ke Switch A9 (Shared Link)
ip addr add 10.91.20.65/29 dev eth1
ip link set eth1 up

# Default Gateway (Ke Minastir)
ip route add default via 10.91.20.85

# Routing ke Router Bawah
# Ke A10 (Morgoth LAN)
ip route add 10.91.20.0/26 via 10.91.20.66
# Ke A11 (Throne LAN)
ip route add 10.91.20.72/29 via 10.91.20.67

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf