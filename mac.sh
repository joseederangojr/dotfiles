#!/usr/bin/env bash

# Define color variables
RESET='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'

DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Function to link files with color output
link_file() {
    local src=$1
    local dest=$2
    local label=$3

    echo -e "${GREEN}Linking ${BOLD}$label${RESET}..."
    if [ -e "$dest" ]; then
        rm -rf "$dest"
    fi
    ln -s "$src" "$dest"
    echo -e "${CYAN}Linked ${label}${RESET} to ${dest}"
}

link_file "$DOTFILES/kitty" "$HOME/.config/kitty" "kitty"

link_file "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf" "tmux"

mkdir -p $HOME/.local/bin
link_file "$DOTFILES/bin/tmux-sessionizer" "$HOME/.local/bin/tmux-sessionizer" "binaries"

link_file "$DOTFILES/nvim" "$HOME/.config/" "nvim"

link_file "$DOTFILES/yabai/.yabairc" "$HOME" "yabai"

link_file "$DOTFILES/skhd/.skhdrc" "$HOME" "skhd"

link_file "$DOTFILES/zsh/.zprofile" "$HOME" "zsh: .zprofile"
link_file "$DOTFILES/zsh/.zshrc" "$HOME" "zsh: .zshrc"

