
function git_branch_delete_all() {
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

alias gbda=git_branch_delete_all
alias txks='tmux kill-server'
alias art='php artisan'
alias pn='pnpm'
alias pnx='pnpm dlx'
alias ls='lsd -1'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias cat="bat --theme=\"Catppuccin Mocha\""
alias cd="z"
alias reload="source $HOME/.zshrc"

# scripts
bindkey -s ^f $HOME/.local/bin/tmux-sessionizer\n
bindkey ^y autosuggest-accept
bindkey '^ ' autosuggest-fetch
bindkey "\el" forward-word
bindkey "\eh" backward-word
bindkey  "\eL" end-of-line
bindkey "\eH" beginning-of-line 
