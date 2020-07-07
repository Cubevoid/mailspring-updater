#!/bin/bash
cd /home/colin/Downloads
rm mailspring-*
echo "Removing old version..."
dnf remove mailspring -y
echo "Downloading latest Mailspring release..."
curl -s https://api.github.com/repos/Foundry376/Mailspring/releases/latest \
  | grep browser_download_url.*rpm \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -
echo "Installing new version..."
dnf install mailspring* -y
rm mailspring-*
echo "Removed junk files."
