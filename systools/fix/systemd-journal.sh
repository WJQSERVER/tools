#!/bin/bash

#fork by https://www.nodeseek.com/post-76866-1

sudo mkdir -p /var/log/journal && sudo systemctl restart systemd-journald && sudo journalctl --flush
grep -q "^Storage=" /etc/systemd/journald.conf && sudo sed -i 's/^Storage=.*/Storage=persistent/' /etc/systemd/journald.conf || echo "Storage=persistent" | sudo tee -a /etc/systemd/journald.conf > /dev/null && sudo systemctl restart systemd-journald && sudo journalctl --flush
grep -q "^Storage=" /etc/systemd/journald.conf && sudo sed -i 's/^Storage=.*/Storage=none/' /etc/systemd/journald.conf || echo "Storage=none" | sudo tee -a /etc/systemd/journald.conf > /dev/null && sudo systemctl restart systemd-journald