# Common functions and variables

# Define color variables
RESET='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'

# Utility functions
is_package_installed() {
    if pacman -Q "$1" &>/dev/null; then
        echo -e "${YELLOW}Package '$1' is already installed.${RESET}"
        return 0
    else
        return 1
    fi
}

install_aur_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if ! is_package_installed "$package"; then
            echo -e "${CYAN}Installing AUR package '$package'...${RESET}"
            yay -S --noconfirm "$package"
        fi
    done
}