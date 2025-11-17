# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3
ip route flush all

# Uplink ke Eregion (A15)
ip addr add 10.91.9.22/30 dev eth0
ip link set eth0 up

# Downlink ke Mondor (A17) -> eth1
ip addr add 10.91.9.29/30 dev eth1
ip link set eth1 up

# Downlink ke Guldur (A16) -> eth2
ip addr add 10.91.9.25/30 dev eth2
ip link set eth2 up

# Downlink ke LAN Arthedian (A18) -> eth3 [FIXED PORT]
ip addr add 10.91.0.1/22 dev eth3
ip link set eth3 up

# Default Gateway (Ke Eregion)
ip route add default via 10.91.9.21

# Routing ke Cabang Guldur (A19, A20)
ip route add 10.91.8.128/25 via 10.91.9.26
ip route add 10.91.9.0/28 via 10.91.9.26

# Routing ke Cabang Mondor/Erain (A22, A23)
ip route add 10.91.4.0/22 via 10.91.9.30
# [FIX] Routing ke Link Mondor-Erain (A21)
ip route add 10.91.9.32/30 via 10.91.9.30

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf