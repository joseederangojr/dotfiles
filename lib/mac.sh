# macOS specific functions

install_xcode() {
  echo -e "${CYAN}Installing ${BOLD}xcode-select${RESET}..."
  xcode-select --install
  echo -e "${GREEN}Installed xcode-select ${RESET}"
}

setup_homebrew() {
  echo -e "${CYAN}Installing ${BOLD}homebrew${RESET}..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  BREW_BIN=$(which brew)
  eval "$($BREW_BIN shellenv)"
  echo -e "${CYAN}Installing ${BOLD}packages using brew bundle${RESET}..."
  brew bundle
}

setup_yabai_skhd() {
  echo -e "${CYAN}Configure skhd and yabai${RESET}..."
  echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
  skhd --start-service
  yabai --start-service
}

