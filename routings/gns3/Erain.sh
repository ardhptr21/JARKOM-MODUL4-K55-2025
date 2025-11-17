# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip route flush all

# Uplink ke Mondor (A21)
ip addr add 10.91.9.34/30 dev eth0
ip link set eth0 up

# LAN A22 (Balrog, Gothmog, Thranduil)
ip addr add 10.91.6.1/23 dev eth1
ip link set eth1 up

# LAN A23 (Melkor, Khazad)
ip addr add 10.91.4.1/23 dev eth2
ip link set eth2 up

# Default Gateway (Ke Mondor)
ip route add default via 10.91.9.33

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf