#!/bin/bash

# ==========================================
# 設定: ターゲットにする入力デバイス
# ==========================================
TARGET_SOURCE="alsa_input.pci-0000_11_00.6.analog-stereo"

# ==========================================
# 関数定義
# ==========================================

# 既存のmodule-loopbackを全て解除する関数
function unload_existing() {
    # module-loopback の ID を検索して全てアンロード
    pactl list modules short | grep module-loopback | cut -f1 | while read id; do
        pactl unload-module "$id" 2>/dev/null
    done
}

# ループバックのストリーム（sink-input）IDを探してミュート/ミュート解除する関数
function set_mute() {
    local state=$1 # 1=mute, 0=unmute
    
    # module-loopbackによって生成された sink-input を検索
    # (PipeWire/PulseAudioのバージョンによって出力形式が少し違うため広く検索)
    pactl list sink-inputs short | grep module-loopback | cut -f1 | while read id; do
        pactl set-sink-input-mute "$id" "$state"
    done
}

# ==========================================
# メイン処理
# ==========================================

case "$1" in
    start)
        echo "Starting Line-in loopback..."
        unload_existing
        # ループバックをロード
        pactl load-module module-loopback source="$TARGET_SOURCE" latency_msec=1
        
        # 第二引数に --mute があれば開始直後にミュートする
        if [ "$2" == "--mute" ]; then
            sleep 0.2 # モジュールロード待ちの微調整
            set_mute 1
            echo "Started (Muted)."
        else
            echo "Started (Unmuted)."
        fi
        ;;
        
    stop)
        echo "Stopping loopback..."
        unload_existing
        ;;
        
    mute)
        echo "Muting loopback..."
        set_mute 1
        ;;
        
    unmute)
        echo "Unmuting loopback..."
        set_mute 0
        ;;
        
    *)
        echo "Usage: $0 {start|stop|mute|unmute}"
        echo "       $0 start --mute  (Start with mute enabled)"
        exit 1
        ;;
esac

exit 0
