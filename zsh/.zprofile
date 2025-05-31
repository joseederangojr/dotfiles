
# Editor
export EDITOR=nvim

# GPG TTY
export GPG_TTY=$(tty)


# Local binaries
export PATH="$PATH:$HOME/.local/bin"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Starship
export STARSHIP_CACHE=~/.config/starship/cache
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"

# xdg
export XDG_HOME_CONFIG="$HOME/.config"

# zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_PLUGINS="$ZSH/plugins"


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
  --color='bw,fg:white,hl:regular:blue,fg+:regular,hl+:regular:blue,info:black:bold,prompt:black:bold,pointer:black:bold'
)

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS_ARR"

# Settings: less
export LESS='-cigRS -j4 -x4 -#5 -z-10'

# Cleanup environment variables
unset MAIL
unset DEBUGINFOD_URLS
