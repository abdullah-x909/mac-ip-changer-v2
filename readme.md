*mac-ip-changer-v2*

mac-ip-changer-v2 is a simple tool designed to change both the MAC address and IP address of your system, enabling you to easily mask your network identity for privacy and security purposes. This tool is intended for macOS and Linux users who need to quickly modify their network configurations.
Features

    Change MAC Address: Randomly or manually change the MAC address of your network interface.
    Change IP Address: Modify the IP address of your system to either a static address or one from a specified range.
    Support for Multiple Interfaces: Supports network interfaces such as Wi-Fi, Ethernet, and more.
    Cross-Platform: Works on both macOS and Linux distributions.

Requirements

Before using mac-ip-changer-v2, ensure that your system meets the following requirements:

    macOS or Linux (other Unix-like OSes may also work)
    sudo privileges (for changing network settings)
Step 1: Clone the Repository

Clone the repository to your local machine using Git:

   ```   
      git clone https://github.com/abdullah-x909/mac-ip-changer-v2.git
 cd mac-ip-changer-v2
```



Step 2: . 🛠 Make Scripts Executable

```
chmod +x setup.sh
chmod +x change_tor_ip.sh
chmod +x mac_changer.sh
```



✅ 3. 🚀 Run the Setup Script

This will:

    Install Tor, netcat, macchanger

    Configure /etc/tor/torrc

    Enable and start both services (IP + MAC changer)

3. 🛠 RUN THE SCRIPT

```
./setup.sh

```

If successful, you'll see:

[✓] Setup complete. Tor IP will rotate, and MAC will change every 15 minutes.

✅ 4. 🔁 Reboot (Optional, for full test)

sudo reboot

This ensures everything auto-starts correctly at boot.
✅ 5. 🔍 Verify Services

Check Tor IP changer service:

systemctl status change-tor-ip.service

Check MAC changer timer & service:

systemctl list-timers | grep mac-changer
systemctl status mac-changer.service

⚠️ Notes

    💡 You can edit mac-changer.timer to change the MAC change interval:

OnUnitActiveSec=10min  # or 5min, 30min, etc.

    🖧 If your interface is not detected properly, update mac_changer.sh with:

IFACE="eth0"  # or wlan0, etc.
