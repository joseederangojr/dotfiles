#!/bin/bash

# Define color variables
RESET='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'

# Get the current working directory of the script for later use
WD=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Create necessary directories if they do not already exist
echo -e "${GREEN}Setting up directories...${RESET}"
mkdir -p $HOME/Dev        # Development directory
mkdir -p $HOME/pkgs       # Packages directory
mkdir -p $HOME/.config    # Configuration directory
mkdir -p $HOME/Pictures   # Pictures directory

# Function to check if a package is installed
is_package_installed() {
    if pacman -Q "$1" &>/dev/null; then
        echo -e "${YELLOW}Package '$1' is already installed.${RESET}"
        return 0
    else
        return 1
    fi
}

# Install essential packages using pacman (Arch Linux's package manager)
echo -e "${BLUE}Installing required packages using pacman...${RESET}"
packages=(
    wget curl zsh git kitty neovim bspwm sxhkd polybar picom brightnessctl
    dunst nitrogen bluez bluez-tools firefox wmctrl rofi openssh
    jq fzf tmux lsd btop fastfetch xclip ripgrep fd bat ly xdotool
    xorg-xrandr playerctl less
)

for package in "${packages[@]}"; do
    if ! is_package_installed "$package"; then
        echo -e "${CYAN}Installing package '$package'...${RESET}"
        sudo pacman -S --noconfirm "$package"
    fi
done

# Install AUR packages using yay (AUR helper)
echo -e "${BLUE}Installing additional packages from AUR using yay...${RESET}"
aur_packages=(
    google-chrome ttf-nerd-fonts-symbols maplemono-nf-cn-unhinted torrent-git
    maim screenkey slop 
)

for package in "${aur_packages[@]}"; do
    if ! is_package_installed "$package"; then
        echo -e "${CYAN}Installing AUR package '$package'...${RESET}"
        yay -S --noconfirm "$package"
    else
        echo -e "${YELLOW}AUR package '$package' is already installed.${RESET}"
    fi
done

# Check if yay is installed, and if not, install it
if ! command -v yay >/dev/null 2>&1; then
    echo -e "${RED}yay is not installed, installing yay from AUR...${RESET}"
    git clone https://aur.archlinux.org/yay.git $HOME/pkgs/yay
    cd $HOME/pkgs/yay || exit
    makepkg -si --noconfirm
    git clean -fdx
    cd "$WD" || exit
else
    echo -e "${YELLOW}yay is already installed.${RESET}"
fi

# Download wallpapers if the directory doesn't already exist
if [ ! -d $HOME/Pictures/wallpapers ]; then
    echo -e "${CYAN}Downloading wallpapers from GitHub repository...${RESET}"
    git clone https://github.com/orangci/walls-catppuccin-mocha.git $HOME/Pictures/wallpapers
else
    echo -e "${YELLOW}Wallpapers already downloaded.${RESET}"
fi

# Configure tmux if it's not already configured
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo -e "${CYAN}Setting up tmux plugin manager (tpm)...${RESET}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo -e "${YELLOW}tmux plugin manager is already installed.${RESET}"
fi

# Install Starship prompt if it's not already installed
if ! command -v starship >/dev/null 2>&1; then
    echo -e "${CYAN}Starship is not installed, installing it...${RESET}"
    curl -sS https://starship.rs/install.sh | sh
else
    echo -e "${YELLOW}Starship prompt is already installed.${RESET}"
fi

# Install mise-en-place if it's not already installed
if ! command -v mise >/dev/null 2>&1; then
    echo -e "${CYAN}mise-en-place is not installed, installing it...${RESET}"
    curl https://mise.run | sh
    echo -e "${CYAN}[mise-enplace]: Installing PHP dependencies...${RESET}"
    
    # Install necessary dependencies for mise-en-place
    php_dependencies=(
      autoconf bison base-devel curl gettext git gd libcurl-compat
      libedit icu libjpeg-turbo mariadb-libs oniguruma libpng postgresql-libs
      readline sqlite openssl pkgconf re2c zlib libxml2 libzip
    )
    for package in "${php_dependencies[@]}"; do
        if ! is_package_installed "$package"; then
            echo -e "${CYAN}Installing PHP dependency '$package'...${RESET}"
            yay -S --noconfirm "$package"
        else
            echo -e "${YELLOW}PHP dependency '$package' is already installed.${RESET}"
        fi
    done
else
    echo -e "${YELLOW}mise-en-place is already installed.${RESET}"
fi


# Install yazi if it's not already installed
if ! command -v yazi >/dev/null 2>&1; then
    echo -e "${CYAN}yazi is not installed, installing it...${RESET}"
    sudo pacman -S yazi --noconfirm
    echo -e "${CYAN}[yazi]: Installing yazi extensions...${RESET}"
    
    # Install necessary extensions for yazi 
    yazi_dependencies=(ffmpeg file p7zip poppler zoxide resvg imagemagick)
    for package in "${yazi_dependencies[@]}"; do
        if ! is_package_installed "$package"; then
            echo -e "${CYAN}Installing Yazi extension '$package'...${RESET}"
            yay -S --noconfirm "$package"
        else
            echo -e "${YELLOW}Yazi extension '$package' is already installed.${RESET}"
        fi
    done 

    echo -e "${CYAN}[yazi]: Installing yazi plugins...${RESET}"
    ya pack -a yazi-rs/plugins:smart-paste
    ya pack -a yazi-rs/plugins:smart-filter
    ya pack -a yazi-rs/plugins:smart-enter

    mkdir -p ~/.config/yazi/plugins
    git clone https://github.com/mgumz/yazi-plugin-bat.git ~/.config/yazi/plugins/bat.yazi
else
    echo -e "${YELLOW}yazi is already installed.${RESET}"
fi

if ! command -v dmenu >/dev/null 2>&1; then
    git clone https://github.com/joseederangojr/dmenu.git  $HOME/pkgs/dmenu
    cd $HOME/pkgs/dmenu && sudo make clean install
fi


if ! command -v docker >/dev/null 2>&1; then
    echo -e "${CYAN}Installing docker${RESET}"
    sudo pacman -S docker --noconfirm
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker run hello-world
fi

if ! systemctl is-active --quiet "bluetooth.service"; then
    echo -e "${CYAN}Enabling bluetooth${RESET}"
    sudo systemctl enable bluetooth 
else
    echo -e "${YELLOW}bluetooth already enabled${RESET}"
fi

if ! systemctl is-active --quiet "ly.service"; then
    echo -e "${CYAN}Enabling ly${RESET}"
    sudo systemctl enable ly
else
    echo -e "${YELLOW}ly already enabled${RESET}"

fi

# End of script
echo -e "${GREEN}${BOLD}Setup complete. All packages and configurations are installed.${RESET}"

