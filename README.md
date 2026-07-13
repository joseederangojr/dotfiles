# Dotfiles

Personal dotfiles collection for macOS, featuring an Everforest theme throughout.

## Configurations

- **aerospace**: Tiling window manager for macOS
- **bat**: Cat clone with syntax highlighting, Git integration, and themes
- **bin**: Custom scripts including `tmux-sessionizer`
- **btop**: Resource monitor
- **fontconfig**: Font rendering configuration
- **git**: Git configuration with aliases, templates, and ignore rules
- **gnupg**: GPG agent configuration
- **gtk**: GTK theme settings
- **kitty**: Terminal emulator with Everforest theme
- **mise**: Development tools version manager
- **nb**: Note-taking tool
- **npm**: npm configuration
- **nvim**: Neovim configuration
- **nushell**: Nushell config (parallel migration from zsh)
- **ssh**: SSH client configuration
- **starship**: Shell prompt
- **tmux**: Terminal multiplexer
- **vscode**: VS Code settings and keybindings
- **zed**: Zed editor settings
- **zsh**: Zsh shell config with plugins and aliases

## Shell migration

- Parallel zsh -> nushell guide: [docs/zsh-to-nushell.md](./docs/zsh-to-nushell.md)
- Nushell tools installed via `mise install`

## Installation

### Prerequisites

- Git
- Xcode command line tools (install via `xcode-select --install`)

### Quick Start

```sh
git clone https://github.com/joseederangojr/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

### Per-config install

```sh
stow --target=$HOME nvim    # install just Neovim config
```

Repeat for any config directory above.

## Dependencies

See [Brewfile](./Brewfile) for the full list of macOS packages, casks, and fonts.

## Notes

- Configs are tailored to personal preferences.
- Everforest theme used throughout.
- For issues or suggestions, open a GitHub issue.
