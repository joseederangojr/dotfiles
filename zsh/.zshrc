HISTFILE=$HOME/.zsh_history # location of the history file
HISTFILESIZE=1000000000 # history limit of the file on disk
HISTSIZE=1000000000 # current session's history limit
SAVEHIST=500000 # zsh saves this many lines from the in-memory history list to the history file upon shell exit
HISTTIMEFORMAT="%d/%m/%Y %H:%M] "

setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed along with the command itself
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.


export ZSH="$HOME/.oh-my-zsh"


fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
plugins=(zsh-autosuggestions)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
source $HOME/.zprofile
# Config
export XDG_HOME_CONFIG="$HOME/.config"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_PLUGINS="$ZSH/plugins"

# Starship.rs
export STARSHIP_CACHE=~/.config/starship/cache
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
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


# Zoxide
eval "$(zoxide init zsh)"

# Direnv
eval "$(direnv hook zsh)"

# editor
alias vim=nvim
export EDITOR=nvim


source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
