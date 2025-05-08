source $HOME/.zprofile
# Config
export XDG_HOME_CONFIG="$HOME/.config"

# Starship.rs
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/oze/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# Local binaries
export PATH="$PATH:$HOME/.local/bin"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Mise-en-place
eval "$(~/.local/bin/mise activate zsh)"
