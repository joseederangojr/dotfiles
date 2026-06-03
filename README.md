# Dotfiles

Personal dotfiles collection for macOS, featuring a Catppuccin Mocha theme throughout.

## Features

This repository uses a modular installation approach with shared libraries in `lib/` for common setup functions.

It contains configurations for the following tools and applications:

- **aerospace**: Tiling window manager for macOS
- **bat**: Cat clone with syntax highlighting, Git integration, and themes
- **bin**: Custom scripts including `tmux-sessionizer`
- **btop**: Resource monitor that shows usage and stats
- **fontconfig**: Font rendering configuration
- **git**: Git configuration with custom aliases, templates, and ignore rules
- **gnupg**: GPG agent configuration for secure operations
- **gtk**: GTK theme settings for consistent UI
- **kitty**: Fast, feature-rich terminal emulator with Catppuccin themes
- **mise**: Development tools version manager (formerly rtx)
- **nb**: Command-line note-taking, bookmarking, and archiving tool
- **npm**: npm configuration
- **nvim**: Neovim text editor with custom Lua configuration and plugins
- **opencode**: AI coding assistant configuration
- **ssh**: SSH client configuration
- **starship**: Minimal, fast, and customizable shell prompt
- **tmux**: Terminal multiplexer with plugins and custom keybindings
- **vscode**: Visual Studio Code settings and keybindings
- **zed**: Zed editor settings
- **zsh**: Zsh shell with Oh My Zsh, plugins, and custom aliases

## Modular Structure

The installation scripts are modularized for maintainability:

- `lib/common.sh`: Shared utilities and color definitions
- `lib/mac.sh`: macOS specific functions
- `lib/mise.sh`: Mise tool version manager setup
- `lib/yazi.sh`: Yazi file manager plugins setup
- `lib/zsh.sh`: Zsh shell setup functions

## Installation

### Prerequisites

- Git
- Xcode command line tools

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
- Set up yazi plugins
- Symlink all configurations using GNU Stow

#### macOS Dependencies (installed via Brewfile)
- **Build-time / libs**: lima-additional-guestagents
- **CLI tools**: aws-vault, awscli, awscli-local, bash, btop, colima, container, curl, diff-so-fancy, docker, docker-compose, ffmpeg, file-formula, gh, git, gnupg, imagemagick, kubernetes-cli, localstack-cli, luarocks, mago, mise, nb, neovim, opencode, parallel, pinentry, pipx, qmk, sshpass, stow, tldr, tmux, wget, zsh
- **Cask (GUI apps)**: aerospace, brave-browser, dbngin, hiddenbar, keycastr, kitty, microsoft-excel, microsoft-outlook, microsoft-powerpoint, microsoft-teams, microsoft-word, ngrok, qmk-toolbox, raycast, slack, spotify, steam, tableplus, vlc, zen
- **Fonts**: font-hack-nerd-font, font-maple-mono-nf-cn, font-symbols-only-nerd-font

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
- Ensure required software is installed before using specific configs.
- The theme used throughout is Catppuccin Mocha for a consistent dark aesthetic.
- For issues, suggestions, or contributions, please open an issue on the GitHub repository.
