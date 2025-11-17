# 1. Reset Total (Membersihkan semua IP dan Routing lama)
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3
ip route flush all

# 2. Interface ke Internet (NAT) - eth0
# Menggunakan IP Statis agar stabil (sesuai hasil troubleshooting)
ip addr add 192.168.122.50/24 dev eth0
ip link set eth0 up

# 3. Tambahkan Default Gateway ke Internet (NAT GNS3)
ip route add default via 192.168.122.1

# 4. Interface ke Sayap Kiri (Formost) - eth1
# Subnet A1: 10.91.26.104/30 -> IP Amonsul .105
ip addr add 10.91.26.105/30 dev eth1
ip link set eth1 up

# 5. Interface ke Sayap Kanan (Minastir) - eth2
# Subnet A6: 10.91.20.80/30 -> IP Amonsul .81
ip addr add 10.91.20.81/30 dev eth2
ip link set eth2 up

# 6. Interface ke Sayap Bawah (Eregion) - eth3
# Subnet A13: 10.91.9.16/30 -> IP Amonsul .17
ip addr add 10.91.9.17/30 dev eth3
ip link set eth3 up

# 7. Routing Supernet (Arahkan paket ke router distribusi masing-masing)
# Ke Sayap Kiri (Blok 10.91.24.0/22) -> Via Formost (.106)
ip route add 10.91.24.0/22 via 10.91.26.106

# Ke Sayap Kanan (Blok 10.91.16.0/21) -> Via Minastir (.82)
ip route add 10.91.16.0/21 via 10.91.20.82

# Ke Sayap Bawah (Blok 10.91.0.0/20) -> Via Eregion (.18)
ip route add 10.91.0.0/20 via 10.91.9.18

# 8. Konfigurasi NAT & DNS (Wajib agar client di bawah bisa internetan)
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# 9. Validasi Akhir
# Cek IP dan koneksi internet
ip a
ping -c 2 8.8.8.8