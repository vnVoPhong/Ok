#!/usr/bin/env bash
# Fedora Multi-App Installer (Flatpak)
# Author: gnohP
# Version: 1.1 (Optimized)
# Description: Install Chrome, Spotify, OBS, or Discord easily via Flatpak.
# Note: Flatpak & Flathub must already be configured.

set -euo pipefail

echo "===================================="
echo " Fedora Multi-App Installer (Flatpak)"
echo "===================================="
echo ""
echo "a part of"
echo "███████╗██╗   ██╗██████╗  █████╗ ██╗   ██╗    ██╗  ██╗██╗   ██╗██████╗ 
██╔════╝╚██╗ ██╔╝██╔══██╗██╔══██╗██║   ██║    ██║  ██║██║   ██║██╔══██╗
███████╗ ╚████╔╝ ██████╔╝███████║██║   ██║    ███████║██║   ██║██████╔╝
╚════██║  ╚██╔╝  ██╔══██╗██╔══██║██║   ██║    ██╔══██║██║   ██║██╔══██╗
███████║   ██║   ██████╔╝██║  ██║╚██████╔╝    ██║  ██║╚██████╔╝██████╔╝
╚══════╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
                                                                       "

# Ask for app to install
read -r -p "Which application do you want to install? (Chrome, Spotify, OBS, Discord, all): " app
app=$(echo "$app" | tr '[:upper:]' '[:lower:]') # normalize input

case "$app" in
  chrome)
    echo ""
    read -r -p "Which version of Chrome? (Stable, Dev, or Chromium): " ver
    ver=$(echo "$ver" | tr '[:upper:]' '[:lower:]')
    case "$ver" in
      stable)
        flatpak install -y flathub com.google.Chrome
        ;;
      dev)
        flatpak install -y flathub com.google.ChromeDev
        ;;
      chromium)
        flatpak install -y flathub org.chromium.Chromium
        ;;
      *)
        echo "❌ Invalid choice. Please choose Stable, Dev, or Chromium."
        exit 1
        ;;
    esac
    ;;
  
  spotify)
    flatpak install -y flathub com.spotify.Client
    ;;
  
  obs)
    flatpak install -y flathub com.obsproject.Studio
    ;;
  
  discord)
    flatpak install -y flathub com.discordapp.Discord
    flatpak install -y flathub de.shorsh.discord-screenaudio
    ;;
  
  all)
    flatpak install -y flathub com.google.Chrome
    flatpak install -y flathub com.spotify.Client
    flatpak install -y flathub com.obsproject.Studio
    flatpak install -y flathub com.discordapp.Discord
    flatpak install -y flathub de.shorsh.discord-screenaudio
    ;;
  
  *)
    echo "❌ Invalid option. Exiting."
    exit 1
    ;;
esac

echo ""
echo "✅ Done. Installation complete!"

