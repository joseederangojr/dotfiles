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
PARENT_DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")/../" && pwd)

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

# Link kitty config
link_file "$PARENT_DOTFILES/kitty" "$HOME/.config/kitty" "kitty"

# Link tmux config
link_file "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf" "tmux"

# Link local binaries
mkdir -p $HOME/.local/bin
link_file "$PARENT_DOTFILES/bin/tmux-sessionizer" "$HOME/.local/bin/tmux-sessionizer" "tmux-sessionizer"

# Link nvim config
link_file "$PARENT_DOTFILES/nvim" "$HOME/.config/nvim" "nvim"

# Link sxhkd config
link_file "$DOTFILES/sxhkd" "$HOME/.config/sxhkd" "sxhkd"

# Link xinit config
link_file "$DOTFILES/xinit/.xinitrc" "$HOME/.xinitrc" "xinit"

# Link bspwm config
link_file "$DOTFILES/bspwm" "$HOME/.config/bspwm" "bspwm"

# Link dunst config
link_file "$DOTFILES/dunst" "$HOME/.config/dunst" "dunst"

# Link picom config
link_file "$DOTFILES/picom" "$HOME/.config/picom" "picom"

# Link polybar config
link_file "$DOTFILES/polybar" "$HOME/.config/polybar" "polybar"

# Link rofi config
link_file "$DOTFILES/rofi" "$HOME/.config/rofi" "rofi"

# Link starship prompt config
link_file "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml" "starship"

# Link zsh config
link_file "$PARENT_DOTFILES/zsh/.zshrc" "$HOME/.zshrc" "zshrc"
link_file "$PARENT_DOTFILES/zsh/.zprofile" "$HOME/.zprofile" "zsh profile"

# Link mise config
link_file "$DOTFILES/mise" "$HOME/.config/mise" "mise"

# Link bat config
link_file "$DOTFILES/bat" "$HOME/.config/bat" "bat"

# Link yazi config
link_file "$DOTFILES/yazi" "$HOME/.config/yazi" "yazi"

# qutebrowser
link_file "$DOTFILES/qutebrowser" "$HOME/.config/qutebrowser" "qutebrowser"

echo -e "${GREEN}${BOLD}All dotfiles linked successfully!${RESET}"

