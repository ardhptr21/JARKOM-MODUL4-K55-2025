#!/bin/sh
#
# =============================================================
# ===   KUMPULAN SKRIP UNTUK SEMUA NODE SAYAP KANAN (C6)  ===
# ===   Prefix Induk Sayap Kanan: 10.91.16.0/21           ===
# =============================================================
#
# Petunjuk: Copy-paste bagian yang sesuai ke terminal node GNS3.
#
# -------------------------------------------------------------
# File: Minastir.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Amonsul): A6 (10.91.20.80/30) -> Amonsul .81 | Minastir .82
# eth1 (ke Amroth): A7 (10.91.20.84/30) -> Minastir .85 | Amroth .86
# eth2 (ke Anor): A8 (10.91.20.88/30) -> Minastir .89 | Anor .90

# Konfigurasi eth0 (ke Amonsul)
auto eth0
iface eth0 inet static
    address 10.91.20.82
    netmask 255.255.255.252
    gateway 10.91.20.81 # Default GW ke Amonsul
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke Amroth)
auto eth1
iface eth1 inet static
    address 10.91.20.85
    netmask 255.255.255.252

# Konfigurasi eth2 (ke Anor)
auto eth2
iface eth2 inet static
    address 10.91.20.89
    netmask 255.255.255.252

# Static Routing (Supernetting Internal)
# 1. Rute ke A12 (via Anor .90)
route add -net 10.91.16.0 netmask 255.255.252.0 gw 10.91.20.90
# 2. Rute Supernet C2 (A9+A10+A11) (via Amroth .86)
route add -net 10.91.20.0 netmask 255.255.255.128 gw 10.91.20.86

echo "Konfigurasi Router Minastir Selesai."


# -------------------------------------------------------------
# File: Anor.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Minastir): A8 (10.91.20.88/30) -> Minastir .89 | Anor .90
# eth1 (LAN A12): A12 (10.91.16.0/22) -> Anor .1

# Konfigurasi eth0 (ke Minastir)
auto eth0
iface eth0 inet static
    address 10.91.20.90
    netmask 255.255.255.252
    gateway 10.91.20.89 # Default GW ke Minastir
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A12)
auto eth1
iface eth1 inet static
    address 10.91.16.1
    netmask 255.255.252.0

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Anor Selesai."


# -------------------------------------------------------------
# File: Amroth.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Minastir): A7 (10.91.20.84/30) -> Minastir .85 | Amroth .86
# eth1 (LAN A9): A9 (10.91.20.64/29) -> Amroth .65 | Morgoth .66 | Throne .67

# Konfigurasi eth0 (ke Minastir)
auto eth0
iface eth0 inet static
    address 10.91.20.86
    netmask 255.255.255.252
    gateway 10.91.20.85 # Default GW ke Minastir
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A9)
auto eth1
iface eth1 inet static
    address 10.91.20.65
    netmask 255.255.255.248

# Static Routing (Internal)
# 1. Rute ke A10 (via Morgoth .66)
route add -net 10.91.20.0 netmask 255.255.255.192 gw 10.91.20.66
# 2. Rute ke A11 (via Throne .67)
route add -net 10.91.20.72 netmask 255.255.255.248 gw 10.91.20.67

echo "Konfigurasi Router Amroth Selesai."


# -------------------------------------------------------------
# File: Morgoth.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Amroth): A9 (10.91.20.64/29) -> Amroth .65 | Morgoth .66
# eth1 (LAN A10): A10 (10.91.20.0/26) -> Morgoth .1

# Konfigurasi eth0 (ke Amroth)
auto eth0
iface eth0 inet static
    address 10.91.20.66
    netmask 255.255.255.248
    gateway 10.91.20.65 # Default GW ke Amroth
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A10)
auto eth1
iface eth1 inet static
    address 10.91.20.1
    netmask 255.255.255.192

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Morgoth Selesai."


# -------------------------------------------------------------
# File: Throne.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Amroth): A9 (10.91.20.64/29) -> Amroth .65 | Throne .67
# eth1 (LAN A11): A11 (10.91.20.72/29) -> Throne .73

# Konfigurasi eth0 (ke Amroth)
auto eth0
iface eth0 inet static
    address 10.91.20.67
    netmask 255.255.255.248
    gateway 10.91.20.65 # Default GW ke Amroth
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A11)
auto eth1
iface eth1 inet static
    address 10.91.20.73
    netmask 255.255.255.248

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Throne Selesai."


# -------------------------------------------------------------
# File: Beacon.sh (Host di LAN A12)
# -------------------------------------------------------------
#
# eth0 (ke Anor): A12 (10.91.16.0/22) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.16.2
    netmask 255.255.252.0
    gateway 10.91.16.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Beacon Selesai."


# -------------------------------------------------------------
# File: Erendis.sh (Host di LAN A10)
# -------------------------------------------------------------
#
# eth0 (ke Morgoth): A10 (10.91.20.0/26) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.20.2
    netmask 255.255.255.192
    gateway 10.91.20.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Erendis Selesai."


# -------------------------------------------------------------
# File: Erebor.sh (Host di LAN A11)
# -------------------------------------------------------------
#
# eth0 (ke Throne): A11 (10.91.20.72/29) -> GW .73

auto eth0
iface eth0 inet static
    address 10.91.20.74
    netmask 255.255.255.248
    gateway 10.91.20.73
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Erebor Selesai."

# === AKHIR DARI FILE right-router-host.sh ===