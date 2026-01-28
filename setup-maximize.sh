#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# devilspie2インストール
if ! command -v devilspie2 &> /dev/null; then
    sudo apt install -y devilspie2
fi

# 設定ディレクトリ作成
mkdir -p ~/.config/devilspie2
mkdir -p ~/.config/autostart

# 設定ファイルをコピー
cp "$SCRIPT_DIR/configs/maximize.lua" ~/.config/devilspie2/

# 自動起動設定
cat > ~/.config/autostart/devilspie2.desktop << EOF
[Desktop Entry]
Type=Application
Name=Devilspie2
Exec=devilspie2
Hidden=false
NoDisplay=true
X-GNOME-Autostart-enabled=true
EOF

# 既存プロセス停止して起動
pkill devilspie2 || true
devilspie2 &

echo "ウィンドウ自動最大化を設定しました"
