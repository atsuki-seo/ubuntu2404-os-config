#!/bin/bash
pkill devilspie2 || true
rm -f ~/.config/autostart/devilspie2.desktop
rm -f ~/.config/devilspie2/maximize.lua
echo "ウィンドウ自動最大化を削除しました"
