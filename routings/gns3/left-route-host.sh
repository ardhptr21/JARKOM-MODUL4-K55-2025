#!/bin/sh
#
# =============================================================
# ===   KUMPULAN SKRIP UNTUK SEMUA NODE SAYAP KIRI (D4)   ===
# ===   Prefix Induk Sayap Kiri: 10.91.24.0/22            ===
# =============================================================
#
# Petunjuk: Copy-paste bagian yang sesuai ke terminal node GNS3.
#
# -------------------------------------------------------------
# File: Formost.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Amonsul): A1 (10.91.26.104/30) -> Amonsul .105 | Formost .106
# eth1 (LAN A2): A2 (10.91.26.96/29) -> Formost .97 | Valindor .98 | Valmar .99

# Konfigurasi eth0 (ke Amonsul)
auto eth0
iface eth0 inet static
    address 10.91.26.106
    netmask 255.255.255.252
    gateway 10.91.26.105 # Default GW ke Amonsul
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A2)
auto eth1
iface eth1 inet static
    address 10.91.26.97
    netmask 255.255.255.248

# Static Routing (Supernetting Internal)
# 1. Rute ke A3 (via Valindor .98)
route add -net 10.91.24.0 netmask 255.255.254.0 gw 10.91.26.98
# 2. Rute Supernet D1 (A4+A5) (via Valmar .99)
route add -net 10.91.26.0 netmask 255.255.255.128 gw 10.91.26.99

echo "Konfigurasi Router Formost Selesai."


# -------------------------------------------------------------
# File: Valindor.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Formost): A2 (10.91.26.96/29) -> Formost .97 | Valindor .98
# eth1 (LAN A3): A3 (10.91.24.0/23) -> Valindor .1

# Konfigurasi eth0 (ke Formost)
auto eth0
iface eth0 inet static
    address 10.91.26.98
    netmask 255.255.255.248
    gateway 10.91.26.97 # Default GW ke Formost
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A3)
auto eth1
iface eth1 inet static
    address 10.91.24.1
    netmask 255.255.254.0

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Valindor Selesai."


# -------------------------------------------------------------
# File: Valmar.sh (Router)
# -------------------------------------------------------------
#
# eth0 (ke Formost): A2 (10.91.26.96/29) -> Formost .97 | Valmar .99
# eth1 (LAN A5): A5 (10.91.26.0/26) -> Valmar .1
# eth2 (LAN A4): A4 (10.91.26.64/27) -> Valmar .65

# Konfigurasi eth0 (ke Formost)
auto eth0
iface eth0 inet static
    address 10.91.26.99
    netmask 255.255.255.248
    gateway 10.91.26.97 # Default GW ke Formost
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi eth1 (ke LAN A5)
auto eth1
iface eth1 inet static
    address 10.91.26.1
    netmask 255.255.255.192

# Konfigurasi eth2 (ke LAN A4)
auto eth2
iface eth2 inet static
    address 10.91.26.65
    netmask 255.255.255.224

# Static Routing: Tidak perlu, default GW sudah cukup.

echo "Konfigurasi Router Valmar Selesai."


# -------------------------------------------------------------
# File: Shadow.sh (Host di LAN A3)
# -------------------------------------------------------------
#
# eth0 (ke Valindor): A3 (10.91.24.0/23) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.24.2
    netmask 255.255.254.0
    gateway 10.91.24.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Shadow Selesai."


# -------------------------------------------------------------
# File: Doriath.sh (Host di LAN A4)
# -------------------------------------------------------------
#
# eth0 (ke Valmar): A4 (10.91.26.64/27) -> GW .65

auto eth0
iface eth0 inet static
    address 10.91.26.66
    netmask 255.255.255.224
    gateway 10.91.26.65
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Doriath Selesai."


# -------------------------------------------------------------
# File: Imrahil.sh (Host di LAN A5)
# -------------------------------------------------------------
#
# eth0 (ke Valmar): A5 (10.91.26.0/26) -> GW .1

auto eth0
iface eth0 inet static
    address 10.91.26.2
    netmask 255.255.255.192
    gateway 10.91.26.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

echo "Konfigurasi Host Imrahil Selesai."

# === AKHIR DARI FILE left-router-host.sh ===