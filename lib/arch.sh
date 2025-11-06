# Arch Linux specific functions

setup_directories() {
    echo -e "${GREEN}Setting up directories...${RESET}"
    mkdir -p $HOME/Dev
    mkdir -p $HOME/pkgs
    mkdir -p $HOME/.config
    mkdir -p $HOME/Pictures
}

install_yay() {
    if ! command -v yay >/dev/null 2>&1; then
        echo -e "${RED}yay is not installed, installing yay from AUR...${RESET}"
        git clone https://aur.archlinux.org/yay.git $HOME/pkgs/yay
        cd $HOME/pkgs/yay || exit
        makepkg -si --noconfirm
        git clean -fdx
        cd "$DOTFILES" || exit
    else
        echo -e "${YELLOW}yay is already installed.${RESET}"
    fi
}

download_wallpapers() {
    if [ ! -d $HOME/Pictures/wallpapers ]; then
        echo -e "${CYAN}Downloading wallpapers from GitHub repository...${RESET}"
        git clone https://github.com/orangci/walls-catppuccin-mocha.git $HOME/Pictures/wallpapers
    else
        echo -e "${YELLOW}Wallpapers already downloaded.${RESET}"
    fi
}

setup_tmux_tpm() {
    if [ ! -d $HOME/.tmux/plugins/tpm ]; then
        echo -e "${CYAN}Setting up tmux plugin manager (tpm)...${RESET}"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        echo -e "${YELLOW}tmux plugin manager is already installed.${RESET}"
    fi
}

configure_gtk() {
    if command -v papirus-folders >/dev/null 2>&1; then
        echo -e "${CYAN}configuring gtk...${RESET}"
        papirus-folders -C cat-mocha-maroon
    fi
}

setup_dmenu() {
    if ! command -v dmenu >/dev/null 2>&1; then
        git clone https://github.com/joseederangojr/dmenu.git $HOME/pkgs/dmenu
        cd $HOME/pkgs/dmenu && sudo make clean install
    fi
}

enable_services() {
    if ! systemctl is-active --quiet "bluetooth.service"; then
        echo -e "${CYAN}Enabling bluetooth${RESET}"
        sudo systemctl enable bluetooth
    fi

    if ! systemctl is-active --quiet "ly.service"; then
        echo -e "${CYAN}Enabling ly${RESET}"
        sudo systemctl enable ly
    fi
}

setup_docker() {
    if command -v docker >/dev/null 2>&1; then
        echo -e "${CYAN}Setting up docker${RESET}"
        sudo groupadd docker
        sudo usermod -aG docker $USER
        newgrp docker
        docker run hello-world
    fi
}