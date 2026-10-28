#!/usr/bin/env bash
# Gnova Music — installer for Linux (x86_64). No root needed.
#   curl -fsSL https://raw.githubusercontent.com/W1nq-coder/gnova-music-download/main/install.sh | bash
set -euo pipefail

URL="https://github.com/W1nq-coder/gnova-music-download/releases/latest/download/gnova-linux-x86_64.tar.gz"

if [[ $(uname -m) != x86_64 ]]; then
    echo "Gnova пока собирается только для x86_64 (у вас $(uname -m))." >&2
    exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo "Скачиваю Gnova Music…"
if command -v curl >/dev/null; then
    curl -fL --progress-bar "$URL" -o "$tmp/gnova.tar.gz"
elif command -v wget >/dev/null; then
    wget -q --show-progress -O "$tmp/gnova.tar.gz" "$URL"
else
    echo "Нужен curl или wget." >&2
    exit 1
fi

tar -xzf "$tmp/gnova.tar.gz" -C "$tmp"
# copies itself to ~/.local/bin and adds the menu entry and icon
"$tmp/gnova/gnova" --install

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) echo "Подсказка: добавьте ~/.local/bin в PATH, чтобы запускать командой gnova." ;;
esac
echo "Готово! Gnova Music есть в меню приложений."
