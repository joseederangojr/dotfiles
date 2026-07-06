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
    .git|docs) continue ;;
  esac
  stow --target="$HOME" --adopt "$dir"
done

echo "==> Installing mise tools..."
mise install 2>/dev/null || echo "    mise not found, skipping"
echo "    nushell + carapace managed by mise (parallel mode: run 'nu')"

echo "==> Installing ZSH plugins"
    ZSH_DIR=$HOME/.zsh
    ZSH_PLUGIN_DIR="$ZSH_DIR/plugins"
    if [ ! -d $ZSH_DIR ]; then
        mkdir $ZSH_DIR
        mkdir -p $ZSH_PLUGIN_DIR
        git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGIN_DIR/zsh-completions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN_DIR/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN_DIR/zsh-autosuggestions
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_PLUGIN_DIR/zsh-autocomplete
    fi
    echo -e "==> zsh configured"

echo "==> Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "==> Done"
