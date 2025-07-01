#!/bin/bash

# Install dependencies
echo "Installing base dependencies..."
sudo apt-get update -y
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r) curl wget git vim tmux openjdk-jre openjdk

# Check if running as root (skip if you have root privileges)
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Create installation directories
INSTALL_DIR="$HOME/app"
BIN_DIR="$INSTALL_DIR/bin"
mkdir -p $INSTALL_DIR
mkdir -p $BIN_DIR

# Update PATH to include the bin directory
echo "Updating PATH to include $BIN_DIR"
echo "export PATH=\$PATH:$BIN_DIR" >> ~/.bashrc
source ~/.bashrc

# Check if Python3 is installed and if it's the latest version
echo "Checking Python3 installation..."
if ! command -v python3 &>/dev/null; then
    echo "Python3 not found. Installing Python3 and pip..."
    sudo apt install -y python3-venv python3-pip
else
    python_version=$(python3 --version 2>&1)
    latest_version="3.10.0"  # Modify to the latest version if needed
    if [[ $(echo -e "$python_version\n$latest_version" | sort -V | head -n1) != $latest_version ]]; then
        echo "Python3 is outdated ($python_version). Updating to the latest version..."
        sudo apt install -y python3-venv python3-pip
    else
        echo "Python3 is up to date: $python_version"
    fi
fi

# Check if Go is installed
echo "Checking Go installation..."
if ! command -v go &>/dev/null; then
    echo "Go not found. Installing Go..."
    wget https://golang.org/dl/go1.19.7.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.19.7.linux-amd64.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
else
    go_version=$(go version)
    echo "Go is installed: $go_version"
fi

# Install Go tools into the ~/app directory
echo "Installing Go tools into $BIN_DIR..."
go_tools=(
    "github.com/tomnomnom/anew"
    "github.com/tomnomnom/assetfinder"
    "github.com/dwisiswant0/cf-check"
    "github.com/projectdiscovery/chaos-client/cmd/chaos"
    "github.com/hahwul/dalfox/v2"
    "github.com/tomnomnom/hacks/filter-resolved"
    "github.com/ffuf/ffuf"
    "github.com/OJ/gobuster/v3"
    "github.com/lc/gau"
    "github.com/tomnomnom/gf"
    "github.com/jaeles-project/gospider"
    "github.com/sensepost/gowitness"
    "github.com/hakluke/hakrawler"
    "github.com/tomnomnom/hacks/html-tool"
    "github.com/projectdiscovery/httpx/cmd/httpx"
    "github.com/jaeles-project/jaeles"
    "github.com/hiddengearz/jsubfinder"
    "github.com/Emoe/kxss"
    "github.com/j3ssie/metabigor"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu"
    "github.com/tomnomnom/qsreplace"
    "github.com/shenwei356/rush"
    "github.com/tomnomnom/hacks/tojson"
    "github.com/003random/getJS"
    "github.com/projectdiscovery/shuffledns/cmd/shuffledns"
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
    "github.com/lc/subjs"
    "github.com/dwisiswant0/unew"
    "github.com/tomnomnom/waybackurls"
    "github.com/projectdiscovery/notify/cmd/notify"
    "github.com/projectdiscovery/notify/cmd/intercept"
    "github.com/deletescape/goop"
    "github.com/003random/getJS"
    "github.com/projectdiscovery/nuclei/v2/cmd/nuclei"
)

# Loop through and install each Go tool
for tool in "${go_tools[@]}"; do
    echo "Installing $tool..."
    go install $tool@latest
done

# Create necessary directories for work
echo "Creating directories for work..."
mkdir -p $HOME/work

# Install Burp Suite
echo "Installing Burp Suite..."
chmod +x burpsuite_community_linux_v2021_4_3.sh
./burpsuite_community_linux_v2021_4_3.sh

# Install ZAP
echo "Installing ZAP..."
chmod +x ZAP_2_10_0_unix.sh
./ZAP_2_10_0_unix.sh

# Ensure all binaries are globally accessible
echo "Ensuring binaries are globally accessible..."
if ! grep -q "$BIN_DIR" ~/.bashrc; then
    echo "export PATH=\$PATH:$BIN_DIR" >> ~/.bashrc
    source ~/.bashrc
fi

echo "Installation complete. You can now run the tools globally from anywhere by typing their name."
