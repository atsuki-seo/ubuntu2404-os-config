#!/bin/bash
# 背景・ロック画面をデフォルトに戻す
gsettings reset org.gnome.desktop.background picture-options
gsettings reset org.gnome.desktop.background primary-color
gsettings reset org.gnome.desktop.screensaver picture-options
gsettings reset org.gnome.desktop.screensaver primary-color
echo "背景・ロック画面をデフォルトに戻しました"
