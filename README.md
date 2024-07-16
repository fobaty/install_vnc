# VNC Installation Script for Ubuntu

This repository contains a script to automatically install and configure VNC on Ubuntu. The script sets up the XFCE desktop environment and TigerVNC server, configures VNC to start at boot, and ensures the necessary firewall rules are in place.

## Features

- Installs XFCE desktop environment
- Installs TigerVNC server
- Configures VNC to start at boot
- Sets up a firewall rule to allow VNC connections

## Requirements

- Ubuntu 18.04 or later
- Root or sudo privileges

## Usage

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/fobaty/vnc-installation-script.git
    cd vnc-installation-script
    ```

2. Make the script executable:

    ```bash
    chmod +x install_vnc.sh
    ```

3. Run the script with root privileges:

    ```bash
    sudo ./install_vnc.sh
    ```

4. Follow the prompts to set your VNC password.

5. After the script completes, you can
