# 1. Reset
ip addr flush dev eth0
ip route flush all

# 2. Config IP
ip addr add 10.91.6.4/23 dev eth0
ip link set eth0 up

# 3. Gateway & DNS
ip route add default via 10.91.6.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# 4. Tes Koneksi
ping -c 2 8.8.8.8