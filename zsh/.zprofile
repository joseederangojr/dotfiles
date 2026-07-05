if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi
# Editor
export EDITOR=nvim

# Local binaries
export PATH="$PATH:$HOME/.local/bin"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Starship
export STARSHIP_CACHE="$HOME/.config/starship/cache"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"

# xdg
export XDG_HOME_CONFIG="$HOME/.config"

# zsh
export ZSH_DIR=$HOME/.zsh
export ZSH_COMPLETIONS_DIR="$ZSH_DIR/completions"
export ZSH_PLUGIN_DIR="$ZSH_DIR/plugins"

# Homebrew
export HOMEBREW_PREFIX=/opt/homebrew

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Programs
export PAGER='less'

export VISUAL="${EDITOR}"


# Settings: fzf
FZF_DEFAULT_OPTS_ARR=(
  --scheme=history
  --ansi
  --exact
  --no-mouse

  # Reverse order
  --tac
  --layout=reverse

  # Styling
  --height=90%
  --min-height=7
  '--prompt="  "'
  --info=inline-right
  --border=none
  --no-scrollbar
  --no-separator
  --color='bg:#0d1117,bg+:#161b22,border:#30363d,fg:#c9d1d9,fg+:#f0f6fc,header:#8b949e,hl:#58a6ff,hl+:#58a6ff,info:#8b949e,marker:#d29922,pointer:#d29922,prompt:#d29922,query:#c9d1d9,spinner:#d29922'
)

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS_ARR"

# Colima

# Settings: less
export LESS='-cigRS -j4 -x4 -#5 -z-10'

# Cleanup environment variables
unset MAIL
unset DEBUGINFOD_URLS

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"
