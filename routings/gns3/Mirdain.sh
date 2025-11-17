# 1. Reset
ip addr flush dev eth0
ip route flush all

# 2. IP Host (Subnet A18)
# IP: 10.91.0.3, Prefix: /22
ip addr add 10.91.0.3/22 dev eth0
ip link set eth0 up

# 3. Default Gateway (Ke Numenor)
ip route add default via 10.91.0.1

# 4. DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# 5. Tes Koneksi
ping -c 2 8.8.8.8