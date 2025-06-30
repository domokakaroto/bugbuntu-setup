#!/bin/bash

# Install dependencies
sudo apt install build-essential dkms linux-headers-$(uname -r)

# Display network interface info
ifconfig

# Mounting CD-ROM
sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom/
cd /mnt/cdrom/

# Install Network Manager
sudo apt install network-manager

# Install Firefox
sudo apt install firefox

# Install Python 3 and pip
python
sudo apt install -y python3-venv python3-pip

# Install Go tools
go install github.com/tomnomnom/anew@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/dwisiswant0/cf-check@latest
go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/tomnomnom/hacks/filter-resolved@latest
go install github.com/ffuf/ffuf@latest
go install github.com/OJ/gobuster/v3@latest
go install github.com/lc/gau@latest
go install github.com/tomnomnom/gf@latest
go install github.com/jaeles-project/gospider@latest
go install github.com/sensepost/gowitness@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/tomnomnom/hacks/html-tool@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/jaeles-project/jaeles@latest
go install github.com/hiddengearz/jsubfinder@latest
go install github.com/Emoe/kxss@latest
go install github.com/j3ssie/metabigor@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/shenwei356/rush@latest
go install github.com/tomnomnom/hacks/tojson@latest
go install github.com/003random/getJS@latest
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/lc/subjs@latest
go install github.com/dwisiswant0/unew@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/projectdiscovery/notify/cmd/intercept@latest
go install github.com/deletescape/goop@latest
go install github.com/003random/getJS@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

# Create necessary directories
mkdir $HOME/work

# Install additional tools
sudo apt-get install vim
sudo apt install tmux
sudo apt-get install plank
sudo apt install openjdk-jre
sudo apt install openjdk

# Install Burp Suite
chmod +x burpsuite_community_linux_v2021_4_3.sh
./burpsuite_community_linux_v2021_4_3.sh

# Install ZAP
chmod +x ZAP_2_10_0_unix.sh
./ZAP_2_10_0_unix.sh
