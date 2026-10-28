#!/usr/bin/env bash
# Gnova Music — remove from Linux. Your library stays unless you pass --purge.
#   curl -fsSL https://raw.githubusercontent.com/W1nq-coder/gnova-music-download/main/uninstall.sh | bash
set -euo pipefail
rm -f "$HOME/.local/bin/gnova" \
      "$HOME/.local/share/applications/gnova.desktop" \
      "$HOME/.local/share/icons/hicolor/128x128/apps/gnova.png"
if [[ ${1:-} == --purge ]]; then
    rm -rf "$HOME/.local/share/gnova" "$HOME/.config/gnova" "$HOME/.cache/gnova"
    echo "Gnova Music удалён вместе с медиатекой и настройками."
else
    echo "Gnova Music удалён. Медиатека и настройки остались в ~/.local/share/gnova и ~/.config/gnova"
    echo "(удалить и их:  bash uninstall.sh --purge)."
fi
