#!/bin/bash
# Nautilusの表示設定
# - XDGディレクトリを日本語名に統一（デスクトップ、ダウンロード等）
# - 英語名のシンボリックリンクを作成（~/Downloads → ~/ダウンロード 等）

BOOKMARKS_FILE="$HOME/.config/gtk-3.0/bookmarks"

# 日本語ディレクトリと英語シンボリックリンクの対応
declare -A DIR_MAP=(
    ["Desktop"]="デスクトップ"
    ["Downloads"]="ダウンロード"
    ["Documents"]="ドキュメント"
    ["Pictures"]="ピクチャ"
    ["Videos"]="ビデオ"
    ["Music"]="ミュージック"
    ["Templates"]="テンプレート"
    ["Public"]="公開"
)

# XDGディレクトリを日本語に設定
xdg-user-dirs-update --force
echo "XDGディレクトリを日本語に設定しました"

# 英語ディレクトリの中身を日本語ディレクトリに移動し、シンボリックリンク作成
for en in "${!DIR_MAP[@]}"; do
    jp="${DIR_MAP[$en]}"
    en_path="$HOME/$en"
    jp_path="$HOME/$jp"

    # 日本語ディレクトリが存在しない場合は作成
    mkdir -p "$jp_path"

    # 英語ディレクトリが実体として存在する場合
    if [ -d "$en_path" ] && [ ! -L "$en_path" ]; then
        # 中身があれば日本語ディレクトリに移動
        if [ -n "$(ls -A "$en_path" 2>/dev/null)" ]; then
            mv "$en_path"/* "$jp_path"/ 2>/dev/null
            mv "$en_path"/.* "$jp_path"/ 2>/dev/null
            echo "移動: $en_path/* → $jp_path/"
        fi
        rmdir "$en_path" 2>/dev/null
    fi

    # 既存のシンボリックリンクを削除
    if [ -L "$en_path" ]; then
        rm "$en_path"
    fi

    # 英語名のシンボリックリンクを作成
    if [ ! -e "$en_path" ]; then
        ln -s "$jp" "$en_path"
        echo "シンボリックリンク: $en → $jp"
    fi
done

# ブックマーク削除
if [ -f "$BOOKMARKS_FILE" ]; then
    rm "$BOOKMARKS_FILE"
    echo "ブックマークを削除しました"
fi

echo ""
echo "設定完了。Nautilusを再起動してください: nautilus -q"
