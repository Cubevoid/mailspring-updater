#!/bin/bash
cd ~/Downloads
rm mailspring-*
echo "Removed old version..."
sudo dnf remove mailspring -y
echo "Downloading latest Mailspring release..."
curl -s https://api.github.com/repos/Foundry376/Mailspring/releases/latest \
  | grep browser_download_url.*rpm \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -
echo "Installing new version..."
sudo dnf install mailspring* -y
rm mailspring-*
echo "Removed junk files."
