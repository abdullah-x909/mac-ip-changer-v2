#!/bin/bash

# Colors
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}"
echo "   _____ _____     _____ _                         "
echo "  |_   _|  __ \   / ____| |                        "
echo "    | | | |__) | | |    | |__   __ _ _ __ ___  ___ "
echo "    | | |  ___/  | |    | '_ \ / _` | '__/ _ \/ __|"
echo "   _| |_| |      | |____| | | | (_| | | |  __/\__ \\"
echo "  |_____|_|       \_____|_| |_|\__,_|_|  \___||___/"
echo "              Tor IP Changer Script"
echo "              MAIN Script by techchip"
echo "         Modified By: github.com/abdullah-x909"
echo -e "${NC}"

# Read auth cookie
COOKIE=$(xxd -ps /var/run/tor/control.authcookie | tr -d '\n')

# Request new identity
printf 'AUTHENTICATE %s\r\nSIGNAL NEWNYM\r\nQUIT\r\n' "$COOKIE" | nc 127.0.0.1 9051 > /dev/null
