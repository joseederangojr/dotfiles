#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Xcode CLT..."
xcode-select --install 2>/dev/null || echo "    already installed"

echo "==> Installing Homebrew..."
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "==> Symlinking configs with stow..."
cd "$DOTFILES_DIR"
for dir in */; do
  dir="${dir%/}"
  case "$dir" in
    .git|bin) continue ;;
  esac
  stow --target="$HOME" --restow "$dir"
done

echo "==> Installing mise tools..."
mise install 2>/dev/null || echo "    mise not found, skipping"

echo "==> Done"
