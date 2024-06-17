#!/bin/sh
interface_style=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
if [[ $? -ne 0 ]]; then
    tmux source-file ~/.tmux_github_light.conf
else
    tmux source-file ~/.tmux_github_dark.conf
fi
