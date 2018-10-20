#!/usr/bin/env bash

# Use aptitude, it is solves problems for you
sudo apt-get install aptitude

# If running Ubuntu 14.04, install these packages
sudo apt-get update
sudo aptitude install gawk wget git diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm picocom ncurses-dev lzop \
     gcc-arm-linux-gnueabihf

sudo aptitude install isc-dhcp-server
sudo aptitude install tftpd-hpa
sudo aptitude install nfs-kernel-server


echo "Modify /etc/dhcp/dhcpd.conf..."
# Setup DHCP config
# /etc/dhcp/dhcpd.conf
# subnet 10.0.0.0 netmask 255.255.255.0 {
#   range 10.0.0.0 10.0.0.254;
# }

# host targetboard {
#    fixed-address 10.0.0.10;
     # Ethernet addr of device, from U-BOOT’s $ethaddr
#    hardware ethernet 00:c0:08:92:4b:9a;
     #filename "zImage";
#}

echo "Modify /etc/exports..."
# /etc/exports
# /nfsroot *(rw,sync,no_root_squash,no_subtree_check)
 

sudo chmod 1777 /var/lib/tftpboot/
sudo mkdir -m 777 /nfsroot
sudo service nfs-kernel-server restart
sudo service isc-dhcp-server restart
sudo service nfs-kernel-server restart

# Don't forget, set CONFIG_NFS_FS=y and CONFIG_ROOT_NFS=y
