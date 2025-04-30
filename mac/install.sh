#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
PARENT_DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}")/../ && pwd)

rm -rf $HOME/.config/kitty
ln -s $PARENT_DOTFILES/kitty $HOME/.config/kitty

rm -rf $HOME/.tmux.conf $HOME/.tmux.github.sh $HOME/.tmux_github_light.conf $HOME/.tmux_github_dark.conf
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/tmux/.tmux_github_light.conf $HOME/.tmux_github_light.conf
ln -s $DOTFILES/tmux/.tmux_github_dark.conf $HOME/.tmux_github_dark.conf
ln -s $DOTFILES/tmux/.tmux.github.sh $HOME/.tmux.github.sh

mkdir -p $HOME/.local/bin
rm -rf $HOME/.local/bin/tmux-sessionizer
ln -s $PARENT_DOTFILES/bin/tmux-sessionizer $HOME/.local/bin/tmux-sessionizer

rm -rf $HOME/.config/nvim
ln -s $PARENT_DOTFILES/nvim $HOME/.config/

rm -rf $HOME/.yabairc
ln -s $DOTFILES/yabai/.yabairc $HOME

rm -rf $HOME/.skhdrc
ln -s $DOTFILES/skhd/.skhdrc $HOME

rm -rf $HOME/.zshrc $HOME/.zprofile
ln -s $PARENT_DOTFILES/zsh/.zshrc $HOME
ln -s $PARENT_DOTFILES/zsh/.zprofile $HOME
