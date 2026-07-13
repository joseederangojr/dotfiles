# --- 1) Base shell behavior, history, and completion
$env.config = ($env.config | merge {
  show_banner: false
  edit_mode: emacs
  show_hints: true
  history: {
    max_size: 100000
    sync_on_enter: true
    file_format: sqlite
  }
  completions: {
    quick: true
    partial: true
    algorithm: "fuzzy"
    external: {
      enable: true
      max_results: 100
    }
  }
})

# Carapace external completer:

if (which carapace | is-not-empty) {
  let carapace_completer = {|spans|
    let cmd = ($spans | first | default "")
    if $cmd == "" { return [] }

    let out = (^carapace $cmd nushell ...$spans | complete)
    if $out.exit_code != 0 { return [] }

    let raw = ($out.stdout | str trim)
    if $raw == "" { return [] }

    $raw | from json
  }

  $env.config = (
    $env.config
    | merge {
        completions: (
          $env.config.completions
          | merge {
              external: (
                $env.config.completions.external
                | merge { completer: $carapace_completer }
              )
            }
        )
      }
  )
}

# --- 5) Direnv (nu-way) ---
use std/config *

# Initialize the PWD hook as an empty list if it doesn't exist
$env.config.hooks.env_change.PWD = $env.config.hooks.env_change.PWD? | default []

$env.config.hooks.env_change.PWD ++= [{||
  if (which direnv | is-empty) {
    # If direnv isn't installed, do nothing
    return
  }

  direnv export json | from json | default {} | load-env
  # If direnv changes the PATH, it will become a string and we need to re-convert it to a list
  $env.PATH = do (env-conversions).path.from_string $env.PATH
}]

alias reload = exec nu
alias vim = nvim
alias v = nvim .
alias e = nvim
alias d = docker
alias dc = docker compose
alias ta = tmux attach
alias tx = tmux kill-server
alias p = php
alias c = composer
alias art = php artisan
alias n = node
alias pn = pnpm
alias k = kubectl
alias kg = kubectl get
alias kgp = kubectl get pods
alias kc = kubectl config
alias kcx = kubectl config set-context
alias rg = rg --hidden --smart-case --glob '!.git/' --no-search-zip --trim --colors line:fg:black --colors line:style:bold --colors path:fg:magenta --colors match:style:nobold
alias sup = pi --no-session -p

# Keybindings
$env.config.keybindings = ($env.config.keybindings ++ [
  {
    name: tmux_sessionizer
    modifier: control
    keycode: char_f
    mode: [emacs]
    event: { send: ExecuteHostCommand cmd: $"($env.HOME)/.local/bin/tmux-sessionizer" }
  }
  {
    name: history_hint_accept
    modifier: control
    keycode: char_y
    mode: [emacs]
    event: { send: HistoryHintComplete }
  }
  {
    name: forward_word_alt_l
    modifier: alt
    keycode: char_l
    mode: [emacs]
    event: { edit: MoveWordRight }
  }
  {
    name: backward_word_alt_h
    modifier: alt
    keycode: char_h
    mode: [emacs]
    event: { edit: MoveWordLeft }
  }
  {
    name: end_of_line_alt_shift_l
    modifier: alt_shift
    keycode: char_l
    mode: [emacs]
    event: { edit: MoveToLineEnd }
  }
  {
    name: beginning_of_line_alt_shift_h
    modifier: alt_shift
    keycode: char_h
    mode: [emacs]
    event: { edit: MoveToLineStart }
  }
])
