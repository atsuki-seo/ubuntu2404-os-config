#!/bin/bash
set -e

sudo rm -f /etc/X11/xorg.conf.d/10-monitor.conf
sudo sed -i 's/^WaylandEnable=false/#WaylandEnable=false/' /etc/gdm3/custom.conf

echo "設定をリバート。再起動してください: sudo reboot"
