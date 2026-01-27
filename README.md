# Ubuntu24.04 OS設定

> [!WARNING]
> これはプライベートなデスクトップPC向けに個別チューニングした設定をメモとして残したものです。
> 一部のスクリプトは後追いで作成しています。
> 他の環境ではそのまま動作しない前提のため、参考にする際は内容を確認の上、適宜調整してください。

Ubuntu環境のカスタム設定を管理するディレクトリ。

## 設定一覧

| 設定 | 内容 | setupスクリプト | revertスクリプト |
|------|------|-----------------|------------------|
| モニター | DP-4をプライマリ、GDMをX11に強制 | setup-monitor.sh | revert-monitor.sh |
| キーボード | CapsLock→Ctrl、Alt⇔Win入れ替え | setup-keyboard.sh | revert-keyboard.sh |
| 背景色 | デスクトップ・ロック画面を#1d1d1dに | setup-appearance.sh | revert-appearance.sh |
| Line-in | オーディオLine-inループバック自動起動 | setup-linein.sh | revert-linein.sh |

## Line-in制御

`linein_ctrl.sh` で手動制御が可能:
```bash
./linein_ctrl.sh start        # ループバック開始
./linein_ctrl.sh start --mute # ミュート状態で開始
./linein_ctrl.sh stop         # ループバック停止
./linein_ctrl.sh mute         # ミュート
./linein_ctrl.sh unmute       # ミュート解除
```

## 使い方

### 全設定を適用
```bash
./setup-monitor.sh      # 要sudo、再起動必要
./setup-keyboard.sh     # 要sudo、再ログイン必要
./setup-appearance.sh   # 即時反映
./setup-linein.sh       # 次回ログインから有効
```

### 設定をリバート
```bash
./revert-monitor.sh     # 要sudo、再起動必要
./revert-keyboard.sh    # 要sudo、再ログイン必要
./revert-appearance.sh  # 即時反映
./revert-linein.sh      # 次回ログインから無効
```

## 関連するシステムファイル

- `/etc/default/keyboard` — キーボード設定
- `/etc/X11/xorg.conf.d/10-monitor.conf` — Xorgモニター設定
- `/etc/gdm3/custom.conf` — GDM設定（Wayland無効化）
- `~/.config/autostart/linein-loopback.desktop` — Line-in自動起動

## configs/

システムに適用される設定ファイルのコピー:
- `10-monitor.conf` — Xorgモニター設定
- `linein-loopback.desktop` — Line-in自動起動設定
