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

# GNOME環境用の設定（即時反映）
if command -v gsettings &> /dev/null; then
    gsettings set org.gnome.desktop.input-sources xkb-options "['altwin:swap_alt_win', 'ctrl:nocaps']"
    echo "GNOME設定を適用しました（即時反映）"
fi

echo "キーボード設定完了"
