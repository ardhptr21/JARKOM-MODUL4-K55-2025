# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush all

# Uplink ke Amonsul (A1) -> eth0
ip addr add 10.91.26.106/30 dev eth0
ip link set eth0 up

# Downlink ke Switch A2 -> eth1
ip addr add 10.91.26.97/29 dev eth1
ip link set eth1 up

# Default Gateway (Ke Amonsul)
ip route add default via 10.91.26.105

# Routing ke Router Bawah (Via IP Tetangga di Switch A2)
# Ke LAN A3 (Milik Valindor .98)
ip route add 10.91.24.0/23 via 10.91.26.98
# Ke LAN A4 & A5 (Milik Valmar .99)
ip route add 10.91.26.0/25 via 10.91.26.99

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf