source $HOME/.zprofile

# Bash completion support (needed for aws_completer)
autoload -U +X bashcompinit && bashcompinit

# Completion defaults (replaces oh-my-zsh completion lib)
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
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# Zsh auto completions
fpath=($ZSH_PLUGIN_DIR/zsh-completions/src $fpath $ZSH_COMPLETIONS_DIR $HOMEBREW_PREFIX/share/zsh/site-functions)
source $ZSH_PLUGIN_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Reduce completion lag — wait briefly before triggering autocomplete
zstyle ':autocomplete:*' delay 0.2
zstyle ':autocomplete:*' timeout 1.0

complete -C aws_completer aws

# _extensions completes glob patterns, _complete is the standard completer
zstyle ':completion:*' completer _extensions _complete

zstyle ':completion:*' menu select  # menu with selection
zstyle ':completion:*' increment yes
zstyle ':completion:*' verbose yes
zstyle ':completion:*' squeeze-slashes yes  # replace // with /

zstyle ':completion:*' file-sort modification  # show recently used files first
zstyle ':completion:*' list-dirs-first yes
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # colored files and directories, blue selection box
zstyle ':completion:*' ignored-patterns '.git'

zstyle ':completion:*' rehash false  # improves performance
zstyle ':completion:*' use-cache true

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

source <(fzf --zsh)

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#606090'
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40

# ZSH Plugin: Syntax Highlighting
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_MAXLENGTH=120

# Rainbow brackets in special order, easier for eyes
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=red'

# Custom styles
# Errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,underline'

# Keywords
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'

# Commands
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=magenta'

# Strings
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'

# Redirections
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'

# Paths
ZSH_HIGHLIGHT_STYLES[path]='none'


# keyboard
bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer\n"
bindkey ^y autosuggest-accept
bindkey '^ ' autosuggest-fetch
bindkey "\el" forward-word
bindkey "\eh" backward-word
bindkey  "\eL" end-of-line
bindkey "\eH" beginning-of-line
