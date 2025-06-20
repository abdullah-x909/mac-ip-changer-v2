#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}"
echo "  _____       _                 _       _             "
echo " / ____|     | |               (_)     | |            "
echo "| (___   ___ | |_   _____ _ __  _  __ _| |_ ___  _ __ "
echo " \___ \ / _ \| \ \ / / _ \ '_ \| |/ _\` | __/ _ \| '__|"
echo " ____) | (_) | |\ V /  __/ | | | | (_| | || (_) | |   "
echo "|_____/ \___/|_| \_/ \___|_| |_|_|\__,_|\__\___/|_|   "
echo "         Full Setup Script by: abdullah-x909"
echo -e "${NC}"

echo -e "${YELLOW}[+] Updating system & installing dependencies...${NC}"
sudo apt update
sudo apt install -y tor netcat macchanger

echo -e "${YELLOW}[+] Configuring Tor...${NC}"
TORRC="/etc/tor/torrc"
if ! grep -q "^ControlPort 9051" "$TORRC"; then
    echo "ControlPort 9051" | sudo tee -a "$TORRC"
fi
if ! grep -q "^CookieAuthentication 1" "$TORRC"; then
    echo "CookieAuthentication 1" | sudo tee -a "$TORRC"
fi

echo -e "${YELLOW}[+] Restarting Tor service...${NC}"
sudo systemctl restart tor

echo -e "${YELLOW}[+] Installing Tor IP changer...${NC}"
sudo cp change_tor_ip.sh /usr/local/bin/change_tor_ip.sh
sudo chmod +x /usr/local/bin/change_tor_ip.sh
sudo cp change-tor-ip.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable change-tor-ip.service
sudo systemctl start change-tor-ip.service

echo -e "${YELLOW}[+] Installing MAC changer service and timer...${NC}"
sudo cp mac_changer.sh /usr/local/bin/mac_changer.sh
sudo chmod +x /usr/local/bin/mac_changer.sh
sudo cp mac-changer.service /etc/systemd/system/
sudo cp mac-changer.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable mac-changer.timer
sudo systemctl start mac-changer.timer

echo -e "${GREEN}[✓] Setup complete. Tor IP will rotate, and MAC will change every 15 minutes.${NC}"

