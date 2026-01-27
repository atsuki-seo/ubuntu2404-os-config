#!/bin/bash
set -e
# キーボード設定: CapsLock→Ctrl, Alt⇔Win入れ替え
sudo tee /etc/default/keyboard > /dev/null << 'EOF'
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="jp"
XKBVARIANT=""
XKBOPTIONS="altwin:swap_alt_win,ctrl:nocaps"

BACKSPACE="guess"
EOF
sudo dpkg-reconfigure -phigh console-setup
echo "キーボード設定完了。再ログインで反映されます"
