#! /bin/bash
set -euo pipefail

echo "[*] Updating package index..."
sudo apt update && sudo apt upgrade -y

echo "[*] Installing base toolchain..."
sudo apt install -y curl wget vim git htop net-tools tree unzip

echo "[*] Environment ready:"
uname -a
lsb_release -a
