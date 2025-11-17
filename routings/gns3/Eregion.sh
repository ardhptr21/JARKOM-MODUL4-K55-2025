# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip route flush all

# Uplink ke Amonsul (A13)
ip addr add 10.91.9.18/30 dev eth0
ip link set eth0 up

# Downlink ke LAN Mirkwood (A14)
ip addr add 10.91.8.1/25 dev eth1
ip link set eth1 up

# Downlink ke Numenor (A15)
ip addr add 10.91.9.21/30 dev eth2
ip link set eth2 up

# Default Gateway (Ke Amonsul)
ip route add default via 10.91.9.17

# Routing Spesifik ke Bawah (Arah Numenor)
# Supernet LAN & Cabang Bawah (A18, A22, A23)
ip route add 10.91.0.0/21 via 10.91.9.22
# Supernet Cabang Guldur (A19, A20)
ip route add 10.91.8.128/25 via 10.91.9.22
ip route add 10.91.9.0/28 via 10.91.9.22
# [FIX] Routing untuk WAN Link Kecil di Bawah (A16, A17, A21)
ip route add 10.91.9.24/29 via 10.91.9.22
ip route add 10.91.9.32/30 via 10.91.9.22

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf