#!/usr/bin/env bash
# Roblox Installer for Fedora Linux
# Author: ChatGPT (for gnohP)
# Version: 1.0
# Purpose: Install Roblox (via VinegarHQ) on a real Fedora system.

set -euo pipefail

echo "Roblox for Linux Installer (Fedora)"
echo "-----------------------------------"
sleep 5
# Function to prompt yes/no
ask_or_exit() {
  local question="$1"
  read -r -p "$question [y/n]: " ans
  case "$ans" in
    [yY]) return 0 ;;
    *) echo "Cancelled."; exit 0 ;;
  esac
}
# Step 1: Install Flatpak and Flathub
ask_or_exit "Would you like to install Flatpak and enable Flathub?"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flatpak and Flathub are ready."
echo ""
sleep 3
# Step 2: Install Roblox (VinegarHQ)
ask_or_exit "Would you like to install Roblox (VinegarHQ)?"
echo "Note: Make sure you have logged into Roblox on your web browser first."
read -r -p "Continue installation? [y/n]: " confirm
case "$confirm" in
  [yY])
    flatpak install flathub org.vinegarhq.Sober
    echo "Roblox installation completed successfully."
    ;;
  *)
    echo "Installation aborted."
    exit 0
    ;;
esac
sleep 3
echo ""
echo "Installation finished."
echo "You can launch Roblox using the application menu or run:"
echo "    flatpak run org.vinegarhq.Sober"
echo ""
sleep 3
echo "WAIT!"
sleep 3
echo "give me a three seconds to give permission update required for Sober!"
flatpak override --user --device=input org.vinegarhq.Sober
sleep 3
echo ""
ask_or_exit "Would you want to install Spotify, OBS, Chrome (Stable, Dev, Chromium) and Discord?"
curl -sSL https://github.com/vnVoPhong/Ok/blob/main/File/install-app.sh | sh
sleep 3
