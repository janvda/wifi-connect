#!/bin/bash

# nohup this script

set -v

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: I am not root"
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "ERROR: illegal number of parameters"
    echo "usage $0 <ssid> <password>"
    exit 1
fi

# install network-manager
apt-get update
apt-get install -y network-manager
if [ $? -ne 0 ]; then
  echo "ERROR: Installation network-manager failed"
  exit 1
fi
apt-get clean

# disable dhcpcd (you will loose network connectivity !!)
systemctl stop dhcpcd

# stop and start network manager
systemctl stop NetworkManager
systemctl start NetworkManager

#disable dhcpcd service (so it won't start at reboot)
systemctl disable dhcpcd

# enable network manager service (so it becomes started at reboot)
systemctl enable NetworkManager

# reconfigure wifi
nmcli dev wifi connect $1 password "$2"
