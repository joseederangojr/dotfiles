# Mise setup functions

setup_mise() {
    if ! command -v mise >/dev/null 2>&1; then
        echo -e "${CYAN}Installing mise-en-place...${RESET}"
        curl https://mise.run | sh
    fi
    eval "$(~/.local/bin/mise activate zsh)"
    echo -e "${CYAN}Installing mise tools${RESET}..."
    mise install
}