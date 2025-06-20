2. 🛠 Make Scripts Executable

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
