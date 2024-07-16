#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install the XFCE desktop environment
sudo apt install xfce4 xfce4-goodies -y

# Install TigerVNC server
sudo apt install tigervnc-standalone-server -y

# Create VNC user directory
mkdir -p ~/.vnc

# Create xstartup file
cat <<EOL > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOL

# Make the xstartup file executable
chmod +x ~/.vnc/xstartup

# Set VNC password
echo "Please enter your VNC password:"
vncpasswd

# Create a systemd service file for VNC
sudo bash -c 'cat <<EOL > /etc/systemd/system/vncserver@.service
[Unit]
Description=Start TigerVNC server at startup
After=syslog.target network.target

[Service]
Type=forking
User=$USER
PAMName=login
PIDFile=/home/$USER/.vnc/%H:%i.pid
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
EOL'

# Reload systemd daemon
sudo systemctl daemon-reload

# Enable VNC service to start at boot (for display :1)
sudo systemctl enable vncserver@1.service

# Start VNC service (for display :1)
sudo systemctl start vncserver@1.service

# Allow VNC through the firewall
sudo ufw allow 5901

echo "VNC installation and configuration complete. You can connect to this server using a VNC client on port 5901."
