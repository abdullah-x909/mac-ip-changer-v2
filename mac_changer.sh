#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}"
echo "  __  __    _    ____ _               "
echo " |  \/  |  / \  / ___| |__   ___ _ __ "
echo " | |\/| | / _ \| |   | '_ \ / _ \ '__|"
echo " | |  | |/ ___ \ |___| | | |  __/ |   "
echo " |_|  |_/_/   \_\____|_| |_|\___|_|   "
echo "      MAC Address Changer Script"
echo "             By: abdullah-x909"
echo -e "${NC}"

# Detect active interface (excluding loopback)
IFACE=$(ip -o link show | awk -F': ' '{print $2}' | grep -v lo | head -n 1)

if [ -z "$IFACE" ]; then
    echo "[-] No active network interface found."
    exit 1
fi

echo "[*] Changing MAC address on $IFACE..."
sudo ip link set $IFACE down
sudo macchanger -r $IFACE
sudo ip link set $IFACE up
