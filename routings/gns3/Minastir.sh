# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip route flush all

# Uplink ke Amonsul (A6)
ip addr add 10.91.20.82/30 dev eth0
ip link set eth0 up

# Downlink ke Amroth (A7)
ip addr add 10.91.20.85/30 dev eth1
ip link set eth1 up

# Downlink ke Anor (A8)
ip addr add 10.91.20.89/30 dev eth2
ip link set eth2 up

# Default Gateway (Ke Amonsul)
ip route add default via 10.91.20.81

# Routing ke Cabang Bawah
# Ke Arah Amroth (Supernet C2: A9+A10+A11)
ip route add 10.91.20.0/25 via 10.91.20.86
# Ke Arah Anor (Subnet A12)
ip route add 10.91.16.0/22 via 10.91.20.90

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf