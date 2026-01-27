#!/bin/bash
set -e

# GDMをX11モードに強制
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf

# xorg設定でDP-4をプライマリに指定
sudo tee /etc/X11/xorg.conf.d/10-monitor.conf > /dev/null << 'EOF'
Section "Monitor"
    Identifier  "DP-4"
    Option      "Primary" "true"
EndSection

Section "Monitor"
    Identifier  "HDMI-0"
    Option      "RightOf" "DP-4"
EndSection
EOF

echo "設定完了。再起動してください: sudo reboot"
