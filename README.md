# 🚀 IP & MAC Changer (with Tor)  
**Supercharge your anonymity with one script!**

[![Tor Anonymity](https://img.shields.io/badge/Tor-Enabled-purple?logo=tor-project)](https://www.torproject.org/)
[![MAC Randomizer](https://img.shields.io/badge/MAC-Randomizer-blue)](https://github.com/alobbs/macchanger)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

> **Rotate your Tor IP & spoof your MAC address automatically, on any Linux system, with blazing simplicity.**

---

## ✨ Features

- 🔄 **Auto-rotate Tor IP:** Change your public IP through Tor at custom intervals.
- 🎭 **Randomize MAC address:** Stay invisible on local networks by changing your MAC before each new IP.
- 🕵️ **Auto-detects network interface:** No headaches — works out-of-the-box on most systems!
- ⚡ **Ultra-lightweight:** Pure Bash. No bloat.
- 🖥️ **Runs at Startup:** Includes systemd service for true always-on privacy.
- 🐧 **Works on all major distros:** Ubuntu, Debian, Kali, Parrot, Arch, Fedora, openSUSE, and more!

---

## 🚀 Get Started

### 1. Clone & Install

```bash
git clone https://github.com/abdullah-x909/ip-changer.git
cd ip-changer
sudo bash ip-changer.sh
```

### 2. Answer the prompts!

- The script will install dependencies and set everything up.
- Choose your desired interval for IP & MAC change (default: 10 seconds).
- Sit back and enjoy the privacy ride!

### 3. (Optional) Enable Autostart

To run the script at every system boot:

```bash
sudo mv ip-changer.sh /usr/local/bin/ip-changer.sh
sudo chmod +x /usr/local/bin/ip-changer.sh
sudo cp ip-changer.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable ip-changer.service
sudo systemctl start ip-changer.service
```

---

## 🖥️ What it looks like

```text
TOR + MAC
 _   _ _____     _____ _                                   
| | | |  __ \   / ____| |                                  
| | | | |__) | | |    | |__   __ _ _ __   __ _  ___ _ __  
| | | |  ___/  | |    |  _ \ / _` | '_ \ / _` |/ _ \ '__| 
| |_| | |      | |____| | | | (_| | | | | (_| |  __/ |    
 \___/|_|       \_____|_| |_|\__,_|_| |_|\__, |\___|_|    
                                         __/ |            
                                        |___/     V 2.0   

[+] Using network interface: wlan0
[*] Starting Tor IP + MAC changer every 10 seconds...

Current MAC: 00:11:22:33:44:55 → New MAC: ab:cd:ef:12:34:56
2025-06-18 20:50:00 - New Tor IP: 185.220.101.50
```

---

## ⚠️ Requirements

- Linux (Debian/Ubuntu/Kali/Parrot/Arch/Fedora/openSUSE)
- `curl`, `tor`, `jq`, `xxd`, `macchanger`
- **Root privileges** (required for network changes)

---

## 🧠 How it works

1. **MAC address is randomized** using `macchanger` for your network interface.
2. **Tor signals a new circuit** (`SIGNAL NEWNYM`), changing your public IP.
3. **Repeat** every N seconds for bulletproof privacy.

---

## 💡 Tips

- **Interface selection:** The script auto-detects your wireless or first physical interface.  
  To force a specific one, run:  
  ```bash
  INTERFACE=your_ifname sudo bash ip-changer.sh
  ```
- **Logs:** For debugging, just redirect stdout/stderr to a file.
- **Want a custom interval?** Just set it at the prompt!
- **Autostart:** Provided systemd service gets you running 24/7.

---

## 🙏 Credits

- [Tor Project](https://www.torproject.org/)
- [macchanger by alobbs](https://github.com/alobbs/macchanger)
- [Original Author: abdullah-x909](https://github.com/abdullah-x909)

---

## 📜 License

This project is licensed under the MIT License — do whatever you want, just give credit!

---

> **Privacy is not a feature. It is your right. Stay safe, stay anonymous. 🚀**