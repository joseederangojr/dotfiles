#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
PARENT_DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}")/../ && pwd)

echo $PARENT_DOTFILES

echo 'Linking kitty';
rm -rf $HOME/.config/kitty
ln -s $PARENT_DOTFILES/kitty $HOME/.config/kitty

echo 'Linking tmux';
rm -rf $HOME/.tmux.conf
ln -s  $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

echo 'Linking local binaries';
mkdir -p $HOME/.local/bin
rm -rf $HOME/.local/bin/tmux-sessionizer
ln -s $PARENT_DOTFILES/bin/tmux-sessionizer $HOME/.local/bin/tmux-sessionizer


echo 'Linking nvim';
rm -rf $HOME/.config/nvim
ln -s $PARENT_DOTFILES/nvim $HOME/.config/


echo 'Linking sxhkd';
rm -rf $HOME/.config/sxhkd
ln -s $DOTFILES/sxhkd $HOME/.config/


echo 'Linking bspwm';
rm -rf $HOME/.config/bspwm
ln -s $DOTFILES/bspwm $HOME/.config/


echo 'Linking dunst';
rm -rf $HOME/.config/dunst
ln -s $DOTFILES/dunst $HOME/.config/


echo 'Linking picom';
rm -rf $HOME/.config/picom
ln -s $DOTFILES/picom $HOME/.config/


echo 'Linking polybar';
rm -rf $HOME/.config/polybar
ln -s $DOTFILES/polybar $HOME/.config/


echo 'Linking rofi';
rm -rf $HOME/.config/rofi
ln -s $DOTFILES/rofi $HOME/.config/


echo 'Linking starship';
rm -rf $HOME/.config/starship.toml
ln -s $DOTFILES/starship/starship.toml $HOME/.config/


echo 'Linking zsh';
rm -rf $HOME/.zshrc $HOME/.zprofile
ln -s $PARENT_DOTFILES/zsh/.zshrc $HOME
ln -s $PARENT_DOTFILES/zsh/.zprofile $HOME
