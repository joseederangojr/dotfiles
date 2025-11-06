# Zsh setup functions

setup_zsh() {
    ZSH_DIR=$HOME/.zsh
    ZSH_PLUGIN_DIR="$ZSH_DIR/plugins"
    if [ ! -d $ZSH_DIR ]; then
        mkdir $ZSH_DIR
        mkdir -p $ZSH_PLUGIN_DIR
        git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGIN_DIR/zsh-completions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN_DIR/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN_DIR/zsh-autosuggestions
    fi
    echo -e "${GREEN}zsh configured ${RESET}"
}

setup_oh_my_zsh() {
    # For macOS, if needed
    if [ ! -d $HOME/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
}