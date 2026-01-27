#!/bin/bash
set -e
# キーボード設定をデフォルトに戻す
sudo tee /etc/default/keyboard > /dev/null << 'EOF'
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="jp"
XKBVARIANT=""
XKBOPTIONS=""

BACKSPACE="guess"
EOF
sudo dpkg-reconfigure -phigh console-setup
echo "キーボード設定をデフォルトに戻しました。再ログインで反映されます"
