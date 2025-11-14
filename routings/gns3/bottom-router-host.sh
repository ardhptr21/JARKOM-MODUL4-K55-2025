#!/bin/sh
#
# =============================================================
# ===  KUMPULAN SKRIP UNTUK SEMUA NODE SAYAP BAWAH (B10)  ===
# ===   Prefix Induk Sayap Bawah: 10.91.0.0/20            ===
# =============================================================
#
# Petunjuk: Copy-paste bagian yang sesuai ke terminal node GNS3.
#
# -------------------------------------------------------------
# File: Eregion.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Amonsul): A13 (10.91.9.16/30) -> Amonsul .17 | Eregion .18
# eth1 (LAN A14): A14 (10.91.8.0/25) -> Eregion .1
# eth2 (ke Numenor): A15 (10.91.9.20/30) -> Eregion .21 | Numenor .22

# Konfigurasi eth0 (ke Amonsul)
auto eth0
iface eth0 inet static
    address 10.91.9.18
    netmask 255.255.255.252
    gateway 10.91.9.17 # Default GW ke Amonsul
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A14)
auto eth1
iface eth1 inet static
    address 10.91.8.1
    netmask 255.255.255.128

# Konfigurasi eth2 (ke Numenor)
auto eth2
iface eth2 inet static
    address 10.91.9.21
    netmask 255.255.255.252

# Static Routing (Supernetting Internal)
# Rute ke SEMUA subnet di bawah Numenor.
# Kita kirim Supernet B3 (A18+B1) dan B2 (A19+A20) via Numenor .22
# 1. Rute Supernet B3 (10.91.0.0/21)
route add -net 10.91.0.0 netmask 255.255.248.0 gw 10.91.9.22
# 2. Rute Supernet B2 (10.91.8.128/24)
route add -net 10.91.8.128 netmask 255.255.255.0 gw 10.91.9.22
# Catatan: Kita tidak bisa meringkas B3+B2 karena A14 (lokal) ada di antaranya.

echo "Konfigurasi Router Eregion Selesai."


# -------------------------------------------------------------
# File: Numenor.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Eregion): A15 (10.91.9.20/30) -> Eregion .21 | Numenor .22
# eth1 (LAN A18): A18 (10.91.0.0/22) -> Numenor .1
# eth2 (ke Guldur): A16 (10.91.9.24/30) -> Numenor .25 | Guldur .26
# eth3 (ke Mondor): A17 (10.91.9.28/30) -> Numenor .29 | Mondor .30

# Konfigurasi eth0 (ke Eregion)
auto eth0
iface eth0 inet static
    address 10.91.9.22
    netmask 255.255.255.252
    gateway 10.91.9.21 # Default GW ke Eregion
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A18)
auto eth1
iface eth1 inet static
    address 10.91.0.1
    netmask 255.255.252.0

# Konfigurasi eth2 (ke Guldur)
auto eth2
iface eth2 inet static
    address 10.91.9.25
    netmask 255.255.255.252

# Konfigurasi eth3 (ke Mondor)
auto eth3
iface eth3 inet static
    address 10.91.9.29
    netmask 255.255.255.252

# Static Routing (Supernetting Internal)
# 1. Rute Supernet B1 (A22+A23) (via Mondor .30)
route add -net 10.91.4.0 netmask 255.255.252.0 gw 10.91.9.30
# 2. Rute Supernet B2 (A19+A20) (via Guldur .26)
route add -net 10.91.8.128 netmask 255.255.255.0 gw 10.91.9.26

echo "Konfigurasi Router Numenor Selesai."


# -------------------------------------------------------------
# File: Mondor.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Numenor): A17 (10.91.9.28/30) -> Numenor .29 | Mondor .30
# eth1 (ke Erain): A21 (10.91.9.32/30) -> Mondor .33 | Erain .34

# Konfigurasi eth0 (ke Numenor)
auto eth0
iface eth0 inet static
    address 10.91.9.30
    netmask 255.255.255.252
    gateway 10.91.9.29 # Default GW ke Numenor
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke Erain)
auto eth1
iface eth1 inet static
    address 10.91.9.33
    netmask 255.255.255.252

# Static Routing (Internal)
# 1. Rute Supernet B1 (A22+A23) (via Erain .34)
route add -net 10.91.4.0 netmask 255.255.252.0 gw 10.91.9.34

echo "Konfigurasi Router Mondor Selesai."


# -------------------------------------------------------------
# File: Guldur.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Numenor): A16 (10.91.9.24/30) -> Numenor .25 | Guldur .26
# eth1 (LAN A19): A19 (10.91.8.128/25) -> Guldur .129
# eth2 (LAN A20): A20 (10.91.9.0/28) -> Guldur .1

# Konfigurasi eth0 (ke Numenor)
auto eth0
iface eth0 inet static
    address 10.91.9.26
    netmask 255.255.255.252
    gateway 10.91.9.25 # Default GW ke Numenor
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A19)
auto eth1
iface eth1 inet static
    address 10.91.8.129
    netmask 255.255.255.128

# Konfigurasi eth2 (ke LAN A20)
auto eth2
iface eth2 inet static
    address 10.91.9.1
    netmask 255.255.255.240

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Guldur Selesai."


# -------------------------------------------------------------
# File: Erain.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Mondor): A21 (10.91.9.32/30) -> Mondor .33 | Erain .34
# eth1 (LAN A22): A22 (10.91.6.0/23) -> Erain .1
# eth2 (LAN A23): A23 (10.91.4.0/23) -> Erain .1

# Konfigurasi eth0 (ke Mondor)
auto eth0
iface eth0 inet static
    address 10.91.9.34
    netmask 255.255.255.252
    gateway 10.91.9.33 # Default GW ke Mondor
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A22)
auto eth1
iface eth1 inet static
    address 10.91.6.1
    netmask 255.255.254.0

# Konfigurasi eth2 (ke LAN A23)
auto eth2
iface eth2 inet static
    address 10.91.4.1
    netmask 255.255.254.0

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Erain Selesai."


# -------------------------------------------------------------
# File: Mirkwood.sh (Host di LAN A14)
# -------------------------------------------------------------
#
# eth0 (ke Eregion): A14 (10.91.8.0/25) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.8.2
    netmask 255.255.255.128
    gateway 10.91.8.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Mirkwood Selesai."


# -------------------------------------------------------------
# File: Arthedian.sh (Host di LAN A18)
# -------------------------------------------------------------
#
# eth0 (ke Numenor): A18 (10.91.0.0/22) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.0.2
    netmask 255.255.252.0
    gateway 10.91.0.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Arthedian Selesai."


# -------------------------------------------------------------
# File: Palantir.sh (Host di LAN A19)
# -------------------------------------------------------------
#
# eth0 (ke Guldur): A19 (10.91.8.128/25) -> GW .129

auto eth0
iface eth0 inet static
    address 10.91.8.130
    netmask 255.255.255.128
    gateway 10.91.8.129
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Palantir Selesai."


# -------------------------------------------------------------
# File: IronCrown.sh (Host di LAN A20)
# -------------------------------------------------------------
#
# eth0 (ke Guldur): A20 (10.91.9.0/28) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.9.2
    netmask 255.255.255.240
    gateway 10.91.9.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host IronCrown Selesai."


# -------------------------------------------------------------
# File: Balrog.sh (Host di LAN A22)
# -------------------------------------------------------------
#
# eth0 (ke Erain): A22 (10.91.6.0/23) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.6.2
    netmask 255.255.254.0
    gateway 10.91.6.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Balrog Selesai."


# -------------------------------------------------------------
# File: Melkor.sh (Host di LAN A23)
# -------------------------------------------------------------
#
# eth0 (ke Erain): A23 (10.91.4.0/23) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.4.2
    netmask 255.255.254.0
    gateway 10.91.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Melkor Selesai."

# === AKHIR DARI FILE bottom-router-host.sh ===