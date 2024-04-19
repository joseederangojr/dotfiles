

# https://github.com/ohmyzsh/ohmyzsh/blob/d17ca487a4357923d8b8681b9e40c2bb2d2fadea/plugins/git/git.plugin.zsh#L20
# Check for develop and similarly named branches
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done

  echo develop
  return 1
}

# Shamelessly pulled from
# https://github.com/ohmyzsh/ohmyzsh/blob/d17ca487a4357923d8b8681b9e40c2bb2d2fadea/plugins/git/git.plugin.zsh#L35
# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

function git_current_branch() {
  echo $(git branch --show-current)
}

function git_branch_delete_all() {
  git branch | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch)|$(git_current_branch))\s*$)" | command xargs git branch --delete 2>/dev/null
}

alias gcob='git checkout -b'
alias gco='git checkout'
alias gcod='git checkout $(git_develop_branch)'
alias gcom='git checkout $(git_main_branch)'
alias glog='git log --oneline --decorate --graph --all'
alias gpso='git push origin $(git_current_branch)'
alias gpsu='git push upstream $(git_current_branch)'
alias gplo='git pull origin $(git_current_branch)'
alias gplu='git pull upstream $(git_current_branch)'
alias gbsu='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbda=git_branch_delete_all
alias gs='git status'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gst='git stash'
alias gsti='git stash --include-untracked'
alias gstc='git stash clear'
alias gmd='git merge $(git_develop_branch)'
alias gmm='git merge $(git_main_branch)'
alias gcl='git clone --recurse-submodules'
alias gdd='git diff $(git_develop_branch) $(git_current_branch)'
alias gdm='git diff $(git_main_branch) $(git_current_branch)'
alias grao='git remote add origin'
alias grau='git remote add upstream'
alias grv='git remote -v'
alias ga='git add'
alias gaa='git add --all'
