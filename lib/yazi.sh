# Yazi setup functions

setup_yazi_plugins() {
    if command -v yazi >/dev/null 2>&1; then
        echo -e "${CYAN}Installing yazi plugins...${RESET}"
        ya pack -a yazi-rs/plugins:smart-paste
        ya pack -a yazi-rs/plugins:smart-filter
        ya pack -a yazi-rs/plugins:smart-enter

        mkdir -p ~/.config/yazi/plugins
        if [ ! -d ~/.config/yazi/plugins/bat.yazi ]; then
            git clone https://github.com/mgumz/yazi-plugin-bat.git ~/.config/yazi/plugins/bat.yazi
        fi
    fi
}