# Reset
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip route flush all

# Uplink ke Numenor (A16)
ip addr add 10.91.9.26/30 dev eth0
ip link set eth0 up

# LAN A19 (Palantir, Edhil)
ip addr add 10.91.8.129/25 dev eth1
ip link set eth1 up

# LAN A20 (IronCrown, Grond, Hobbiton)
ip addr add 10.91.9.1/28 dev eth2
ip link set eth2 up

# Default Gateway (Ke Numenor)
ip route add default via 10.91.9.25

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf