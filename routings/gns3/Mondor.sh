# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush all

# Uplink ke Numenor (A17)
ip addr add 10.91.9.30/30 dev eth0
ip link set eth0 up

# Downlink ke Erain (A21)
ip addr add 10.91.9.33/30 dev eth1
ip link set eth1 up

# Default Gateway (Ke Numenor)
ip route add default via 10.91.9.29

# Routing ke LAN Erain (A22, A23)
ip route add 10.91.4.0/22 via 10.91.9.34

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf