#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# autostartディレクトリ作成（なければ）
mkdir -p ~/.config/autostart

# desktopファイルをコピー（Execパスを更新）
cat > ~/.config/autostart/linein-loopback.desktop << EOF
[Desktop Entry]
Type=Application
Name=Line-in Loopback
Comment=Enable Line-in loopback with mute on login
Exec=${SCRIPT_DIR}/linein_ctrl.sh start
StartupNotify=false
Terminal=false
X-GNOME-Autostart-enabled=true
EOF

echo "Line-in loopback自動起動を設定しました"
