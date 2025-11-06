# Dotfiles

Personal dotfiles collection for macOS and Linux setups, featuring a Catppuccin Mocha theme throughout.

## Features

This repository uses a modular installation approach with shared libraries in `lib/` for common setup functions.

It contains configurations for the following tools and applications:

- **aerospace**: Tiling window manager for macOS
- **bat**: Cat clone with syntax highlighting, Git integration, and themes
- **betterlockscreen**: Simple lock screen utility for Linux
- **bin**: Custom scripts including `install-php-ext` and `tmux-sessionizer`
- **bspwm**: Binary space partitioning window manager for Linux
- **btop**: Resource monitor that shows usage and stats
- **dunst**: Lightweight notification daemon
- **fontconfig**: Font rendering configuration
- **git**: Git configuration with custom aliases, templates, and ignore rules
- **gnupg**: GPG agent configuration for secure operations
- **gtk**: GTK theme settings for consistent UI
- **kitty**: Fast, feature-rich terminal emulator with Catppuccin themes
- **mise**: Development tools version manager (formerly rtx)
- **nb**: Command-line note-taking, bookmarking, and archiving tool
- **nvim**: Neovim text editor with custom Lua configuration and plugins
- **picom**: Compositor for X11 with animations and effects
- **polybar**: Highly customizable status bar for window managers
- **qt**: Qt5/Qt6 theme configurations
- **rofi**: Application launcher, window switcher, and dmenu replacement
- **screenkey**: Screencast utility that displays pressed keys
- **skhd**: Simple hotkey daemon for macOS
- **ssh**: SSH client configuration
- **starship**: Minimal, fast, and customizable shell prompt
- **sxhkd**: Simple X hotkey daemon for Linux
- **tmux**: Terminal multiplexer with plugins and custom keybindings
- **vscode**: Visual Studio Code settings and keybindings
- **xinit**: X11 session initialization script
- **yabai**: Tiling window manager for macOS
- **yazi**: Terminal file manager with image previews
- **zsh**: Zsh shell with Oh My Zsh, plugins, and custom aliases

## Modular Structure

The installation scripts are modularized for maintainability:

- `lib/common.sh`: Shared utilities and color definitions
- `lib/zsh.sh`: Zsh shell setup functions
- `lib/mise.sh`: Mise tool version manager setup
- `lib/yazi.sh`: Yazi file manager plugins setup
- `lib/arch.sh`: Arch Linux specific functions
- `lib/mac.sh`: macOS specific functions

## Installation

### Prerequisites

- Git
- For macOS: Xcode command line tools
- For Linux (Arch): `yay` (AUR helper)

### Clone the Repository

```sh
git clone https://github.com/joseederangojr/dotfiles.git
cd dotfiles
```

### macOS Setup

Run the automated setup script:

```sh
./apple
```

This script will:
- Install Xcode command line tools
- Install Homebrew and packages from `Brewfile`
- Set up Zsh with Oh My Zsh and plugins
- Configure mise for tool version management
- Install and configure yabai and skhd
- Set up yazi plugins
- Symlink all configurations using GNU Stow

#### macOS Dependencies (installed via Brewfile)
- **Build-time / libs**: lima-additional-guestagents
- **CLI tools**: aws-vault, awscli, bash, bat, btop, colima, container, curl, diff-so-fancy, direnv, docker, docker-compose, eza, fd, ffmpeg, file-formula, fzf, gh, git, imagemagick, jq, kubernetes-cli, lazydocker, lsd, luarocks, mise, nb, neovim, opencode, parallel, pinentry, poppler, qmk, resvg, ripgrep, sevenzip, sshpass, starship, stern, stow, tmux, wget, yazi, yq, zoxide, zsh
- **Cask (GUI apps)**: aerospace, kitty, nikitabobko/tap/aerospace, qmk-toolbox, raycast, tableplus, visual-studio-code, vlc, zen, zed
- **Fonts**: font-maple-mono-nf-cn, font-symbols-only-nerd-font

### Arch Linux Setup

Run the automated setup script:

```sh
./arch
```

This script will:
- Install packages via `yay` (including base system, development tools, and desktop environment components)
- Download wallpapers
- Set up tmux plugin manager
- Install and configure mise
- Set up Zsh with plugins
- Install yazi plugins
- Enable system services (Bluetooth, display manager)
- Symlink all configurations using GNU Stow

#### Arch Linux Dependencies (installed via yay)
- base, linux, linux-firmware, bat, betterlockscreen, bluez, bluez-tools, brave-bin, brightnessctl, bspwm, btop, calc, catppuccin-gtk-theme-mocha, curl, diff-so-fancy, direnv, docker, docker-compose, dunst, fastfetch, fd, ffmpeg, file, fzf, git, imagemagick, jq, kitty, kmonad, less, lsd, lxappearance-gtk3, ly, maim, maplemono-nf-cn-unhinted, nb, neovim, networkmanager-dmenu, nitrogen, openssh, papirus-folders-catppuccin-git, papirus-icon-theme, p7zip, picom, playerctl, polybar, poppler, qmk, qt5ct, qt6ct, resvg, ripgrep, rofi, screenkey, slop, starship, stow, sxhkd, tmux, torrent-git, ttf-nerd-fonts-symbols, vlc, visual-studio-code-bin, wget, wmctrl, xclip, xdotool, xorg-xrandr, yad, yazi, zed, zoxide, zsh

### Manual Installation

If you prefer to set up manually, use GNU Stow to symlink configurations:

```sh
stow --target=$HOME <config-directory>
```

For example, to install Neovim config:

```sh
stow --target=$HOME nvim
```

Repeat for each desired configuration.

## Additional Notes

- These configurations are tailored to personal preferences and may require adjustments for your system.
- Ensure required software is installed before using specific configs (e.g., window managers, terminal emulators).
- The theme used throughout is Catppuccin Mocha for a consistent dark aesthetic.
- For issues, suggestions, or contributions, please open an issue on the GitHub repository.</content>
