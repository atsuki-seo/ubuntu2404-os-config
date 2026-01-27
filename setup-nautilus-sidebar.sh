#!/bin/bash
# Nautilusの表示設定
# - XDGディレクトリを英語名に変換（デスクトップ→Desktop等）
# - サイドバー：日本語表示のみ（ブックマーク削除）

BOOKMARKS_FILE="$HOME/.config/gtk-3.0/bookmarks"

# XDGディレクトリを英語名に変換
LANG=C xdg-user-dirs-update --force
echo "XDGディレクトリを英語名に変換しました"

# ブックマーク削除（サイドバーを日本語表示のみに）
if [ -f "$BOOKMARKS_FILE" ]; then
    rm "$BOOKMARKS_FILE"
    echo "ブックマークを削除しました"
else
    echo "ブックマークファイルは存在しません"
fi

echo ""
echo "ファイルエクスプローラーを再起動してください"
