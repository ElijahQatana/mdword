#!/usr/bin/env bash
# Installs mdword to ~/.local/bin (or $XDG_BIN_HOME) and its reference
# template to $XDG_CONFIG_HOME/mdword (default ~/.config/mdword), both
# already-standard locations, nothing new invented off $HOME to make a friend TM happy.
#
# Run: bash install.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BIN_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/mdword"

mkdir -p "$BIN_DIR" "$CONFIG_DIR"
install -m 755 "$SCRIPT_DIR/mdword" "$BIN_DIR/mdword"
install -m 644 "$SCRIPT_DIR/reference.docx" "$CONFIG_DIR/reference.docx"

echo "Installed:"
echo "  $BIN_DIR/mdword"
echo "  $CONFIG_DIR/reference.docx"
echo ""

# Check the real PATH at runtime rather than grepping a dotfile, which avoids
# false negatives if PATH is already set some other way (.zprofile, a
# plugin manager, direnv, etc for you special cookies ;) ).
case ":$PATH:" in
  *":$BIN_DIR:"*)
    echo "$BIN_DIR is already on your PATH. Try: mdword --help"
    ;;
  *)
    echo "$BIN_DIR is not currently on your PATH."
    echo "Add it however you manage your shell config, e.g.:"
    echo ""
    echo "  export PATH=\"$BIN_DIR:\$PATH\""
    echo ""
    if [ -t 0 ]; then
      read -r -p "Append that line to ~/.zshrc now? [y/N] " reply
    else
      reply="n"
    fi
    if [[ "${reply:-}" =~ ^[Yy]$ ]]; then
      {
        echo ''
        echo '# Added by mdword installer'
        echo "export PATH=\"$BIN_DIR:\$PATH\""
      } >> "$HOME/.zshrc"
      echo "Added to ~/.zshrc. Open a new terminal or run: source ~/.zshrc"
    else
      echo "Skipped - Fine add it yourself whenever you like."
    fi
    ;;
esac
