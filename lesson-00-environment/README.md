# Lesson 0. Environment Setup

**Date:** 2026-08-31
**Goal:** Prepare a local Linux environment for DevOps learning

---

## Stack

| Component | Version |
|-----------|---------|
| Hypervisor | VMware Workstation Pro 26H1 |
| OS | Ubuntu Server Workstation Pro 26H1 |
| Kernel | 5.15.0-190-generic |
| RAM | 4 GB |
| Disk | 30 GB SCSI |

---

## Network

| Parameter | Value |
| --------- | ----- |
| Interface | ens32 |
| IP | 192.168.78.100/24 |
| Gateway | 192.168.78.2 |
| DNS | 8.8.8.8, 8.8.4.4 |
| Mode | NAT |

Config: `/etc?netplan/00-installer-config.yaml

---

## Base ToolChain

Installed packages
- `curl`, `wget` - HTTP requests
- `vim` - terminal editor
- `git` - version control
- `htop` - process monitoring
- `net-tools` - legacy network utilities
- `tree` - directory tree view
- `unzip` - archive extraction
- `ca-certificates`, `gnupg` - security

Command:
```bash
sudo apt install -y curl wget vim git htop net-tools tree unzip ca-certificates gnupg lsb-release

---

## Automation

File: setup.sh

idempotent bootstrap script for fresh Ubuntu:

- Update Packege index
- Installs base toolchain
- Prints system info

Key features:

- set -euo pipefall - strict error handling
- sudo - runs with elevated privileges
- && - seqential execution with fail-fast

---

## Key Commands

uname -a (Kernel version,architecture)
lsb_release -a (OS version)
ip addr show (Network interfaces)
sudo apt update && sudo apt upgrade -y (System update)
htop (Interactive process viewer)
chmod +x file (Make file executable)
 
