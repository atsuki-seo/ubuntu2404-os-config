#!/bin/bash
# 背景・ロック画面を単色(#1d1d1d)に設定
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#1d1d1d'
gsettings set org.gnome.desktop.screensaver picture-options 'none'
gsettings set org.gnome.desktop.screensaver primary-color '#1d1d1d'
echo "背景・ロック画面の色を設定しました"
