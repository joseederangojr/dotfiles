# functions
function  gcm() { git commit --message "$*" }
function gbda() {
  git branch | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch)|$(git_current_branch))\s*$)" | command xargs git branch --delete 2>/dev/null
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Aliases: ls
alias l='eza -1A --group-directories-first --color=always --git-ignore'
alias ls='l'
alias la='l -l --time-style="+%Y-%m-%d %H:%M" --no-permissions --octal-permissions'
alias tree='l --tree'

# Aliases: git
alias ga='git add'
alias gap='ga --patch'
alias gb='git branch'
alias gba='gb --all'
alias gc='git commit'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gco='git checkout'
alias gcl='git clone --recursive'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gds='gd --staged'
alias gi='git init'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gm='git merge'
alias gn='git checkout -b'
alias gp='git push'
alias gr='git reset'
alias gs='git status --short'
alias gu='git pull'


# Aliases: docker
alias d='docker'
alias dc='docker compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dl='docker logs --tail=100'

# Aliases: tmux
alias ta='tmux attach'
alias tl='tmux list-sessions'
alias tn='tmux new-session -s'
alias tx='tmux kill-server'

# Aliases: PHP/Composer
alias p='php'
alias c='composer'
alias cr='c require'
alias ci='c install'
alias cda='c dump autoload'
alias pa='php artisan'

# Alias: Laravel
alias pas='pa serve'
alias pam='pa make'
alias pammi='pam:migration'
alias pammo='pam:model'
alias pamc='pam:controller'
alias paq='pa queue'
alias paqw='paq:work'
alias pamig='pa migrate'
alias pamif='pa migrate:fresh'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Aliases: rg
alias rg="rg --hidden --smart-case --glob='!.git/' --no-search-zip --trim --colors=line:fg:black --colors=line:style:bold --colors=path:fg:magenta --colors=match:style:nobold"

# Aliases: systemd
alias sd='sudo systemctl'
alias sdu='systemctl --user'
alias jd='journalctl --no-pager'

# Aliases: human-readable
alias cal='TZ=Asia/Manila cal'
alias du='du --human-readable'
alias free='free --human'


# Aliases: Node
alias pn='pnpm'
alias pnx='pnpm dlx'

# Aliases: cat
alias cat="bat --theme=\"Catppuccin Mocha\""


# Aliases: Zsh Reload
alias reload="source $HOME/.zshrc"

# Aliases: Editor
alias vim=nvim
alias v='nvim .'
alias e='nvim' 


# keyboard
bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer\n"
bindkey ^y autosuggest-accept
bindkey '^ ' autosuggest-fetch
bindkey "\el" forward-word
bindkey "\eh" backward-word
bindkey  "\eL" end-of-line
bindkey "\eH" beginning-of-line 

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

# Auto complete
fpath=($ZSH_PLUGINS/zsh-completions/src $fpath)
autoload -U compinit && compinit -C
# _complete is base completer
# _approximate will fix completion if there is no matches
# _extensions will complete glob patters with extensions
zstyle ':completion:*' completer _extensions _complete _approximate

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

# oh-my-zsh
source $HOME/.zprofile
source $ZSH/oh-my-zsh.sh
# Config

# Starship.rs
eval "$(starship init zsh)"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Mise-en-place
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
elif [ -f /usr/local/bin/mise ]; then
  eval "$(/usr/local/bin/mise activate zsh)"
elif [ -f "$HOME/.local/bin/mise" ]; then
  eval "$("$HOME/.local/bin/mise" activate bash)"
fi


# FZF
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
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
  --preview 'tree -C {}'"

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

source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#606090'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40


source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

