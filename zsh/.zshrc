source $HOME/.zprofile

# Native zsh completion (basic)
# Include custom completions + zsh-completions plugin
fpath=("$ZSH_PLUGIN_DIR/zsh-completions/src" "$ZSH_COMPLETIONS_DIR" $fpath)
autoload -Uz compinit
compinit

# Completion defaults
setopt auto_menu         # show completion menu on successive tab press
setopt always_to_end
zstyle ':completion:*' special-dirs true

# Kubectl + Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Aliases: ls
alias l='eza -1A --group-directories-first --color=always --git-ignore'
alias la='l -l --time-style="+%Y-%m-%d %H:%M" --no-permissions --octal-permissions'
alias tree='l --tree'

# Aliases: docker
alias d='docker'
alias dc='docker compose'

# Aliases: tmux
alias ta='tmux attach'
alias tx='tmux kill-server'

# Aliases: PHP/Composer
alias p='php'
alias c='composer'
alias art='php artisan'

# Alias: Laravel
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Aliases: rg
alias rg="rg --hidden --smart-case --glob='!.git/' --no-search-zip --trim --colors=line:fg:black --colors=line:style:bold --colors=path:fg:magenta --colors=match:style:nobold"

# Aliase: Node
alias n='node'
alias pn='pnpm'

# Aliases: cat


# Aliases: pi (q)
q() {
  local prompt="$*"
  pi -p "$prompt"
}

# Aliases: Zsh Reload

alias reload="exec zsh"

# Aliases: Editor
alias vim=nvim
alias v='nvim .'
alias e='nvim' 

# Aliases kubectl
alias k=kubectl

# Aliases clear
alias x=clear

HISTFILE=$HOME/.zsh_history # location of the history file
HISTFILESIZE=100000  # history limit of the file on disk
HISTSIZE=100000      # current session's history limit
SAVEHIST=50000       # zsh saves this many lines from the in-memory history list to the history file upon shell exit
HISTTIMEFORMAT="%d/%m/%Y %H:%M] "

setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed along with the command itself
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# Completion plugins
# zsh-completions loaded via fpath above
source $ZSH_PLUGIN_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Config

# Starship.rs
eval "$($HOME/.local/share/mise/installs/starship/latest/starship init zsh)"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Mise-en-place
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
elif [ -f /usr/local/bin/mise ]; then
  eval "$(/usr/local/bin/mise activate zsh)"
elif [ -f "$HOME/.local/bin/mise" ]; then
  eval "$("$HOME/.local/bin/mise" activate zsh)"
fi


# FZF
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'eza --tree --color=always {}'"

# source <(fzf --zsh)  # disabled to keep native completion only

# Zoxide
export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS --select-1 --exit-0"
eval "$(zoxide init zsh)"
function ze() {
  DIR=$(zoxide query -i "$@")
  [ -n "$DIR" ] && cd "$DIR" && e .
}
alias ~='cd ~'
alias cdx='__zoxide_zi'
alias cd="z"

# Direnv
eval "$(direnv hook zsh)"

# ZSH Plugin: Auto autosuggestions 
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6e7681'
ZSH_AUTOSUGGEST_STRATEGY=(history)

# ZSH Plugin: Syntax Highlighting
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_MAXLENGTH=120

# GitHub Dark Colorblind-ish palette
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#79c0ff'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#e3b341'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#a5d6ff'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#ffa657'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=#d2a8ff'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=#7ee787'

# Custom styles
# Errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff7b72,underline'

# Keywords
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#79c0ff'

# Commands
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#79c0ff'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#ffa657'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#ffa657'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#ffa657,bold'

# Strings
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#a5d6ff'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#a5d6ff'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e3b341'

# Redirections
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#8b949e'

# Paths
ZSH_HIGHLIGHT_STYLES[path]='fg=#c9d1d9'

# keyboard
# Force emacs keymap (disable vi normal mode in zsh line editor)
bindkey -e

bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer\n"
bindkey ^y autosuggest-accept
bindkey '^ ' autosuggest-fetch
bindkey "\el" forward-word
bindkey "\eh" backward-word
bindkey  "\eL" end-of-line
bindkey "\eH" beginning-of-line
