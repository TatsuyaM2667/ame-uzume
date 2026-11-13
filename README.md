# ame-uzume

音量を読む・変える・消音・見張る小さなコマンド(Odin。wpctl・pactl subscribe の代わり)。

[ame-shell](https://github.com/TatsuyaM2667/ame-shell)(Wayland のデスクトップシェル)の一部を、単独で使えるように切り出したものです。
ame-shell は画面の要らない仕事を、1 つのことをして標準入出力でやりとりする小さなコマンドに分けています。これはその 1 つです。

## 使い方

```text
ame-uzume: 音量を読む / 変える / 見張る(wpctl・pactl の代わり)。
名前は天岩戸の前で舞い、音を鳴らした芸能の神、天宇受売命(あめのうずめ)から。

  ame-uzume                  今の音量を 1 行(「45」、消音なら「45 muted」)
  ame-uzume set 40 | +5 | -5 音量を変える(0〜100。100 は超えない: 耳とスピーカーを守る)
  ame-uzume mute [on|off]    消音を切り替える(on / off で決め打ち)
  ame-uzume restore          最後に set / mute した音量に戻す(ログインのとき)
  ame-uzume watch            今の音量を 1 行、その後は変わるたびに 1 行(終わらない)

相手は既定の出力(@DEFAULT_SINK@)。PulseAudio の口(PipeWire なら pipewire-pulse)に libpulse で話す。
libpulse は実行時に読む(ヘッダも -dev パッケージも要らない。無ければ 1 で終わる)。
set / mute した値は $XDG_STATE_HOME/ame-shell/volume に「45 0」の形で覚える。
終了コード: 0 できた / 1 音の口につながらない・変えられない / 2 使い方の誤り
```

## ビルド

```sh
sh build.sh   # ./ame-uzume(Odin dev-2026-08 以降。libpulse などは実行時に読むので、ヘッダも -dev パッケージも要らない)
odin test .
```

実行に要るもの: `libpulse`

## このリポジトリについて

正本は ame-shell の `odin/ame-uzume/main.odin` です。このリポジトリは `scripts/split-repos.sh` が生成して同期しています。
直したいところがあれば ame-shell の方へお願いします。

ライセンス: GPL-3.0(ame-shell と同じ)
