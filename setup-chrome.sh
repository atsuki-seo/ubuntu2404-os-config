#!/bin/bash
# Chrome重複表示修正
# Chromeパッケージのバグにより、com.google.Chrome.desktopのNoDisplay=trueが
# 正しい位置に配置されていないため、アプリ検索でChromeが2つ表示される問題を修正

set -e

DESKTOP_FILE="$HOME/.local/share/applications/com.google.Chrome.desktop"

mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" << 'EOF'
[Desktop Entry]
Name=Google Chrome
NoDisplay=true
Type=Application
EOF

echo "Chrome重複表示を修正しました: $DESKTOP_FILE"
