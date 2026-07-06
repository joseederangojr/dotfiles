# Restored env.nu

# Local secrets
try {
  source-env ~/.profile.nu
}

# Core env
$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "less"
$env.GOPATH = ($env.HOME | path join "go")
$env.XDG_HOME_CONFIG = ($env.HOME | path join ".config")
$env.XDG_CONFIG_HOME = $env.XDG_HOME_CONFIG
$env.STARSHIP_CACHE = ($env.HOME | path join ".config/starship/cache")
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config/starship/starship.toml")
$env.PNPM_HOME = ($env.HOME | path join ".local/share/pnpm")
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.KREW_ROOT = ($env.HOME | path join ".krew")
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
$env.DOCKER_HOST = $"unix://($env.HOME)/.colima/default/docker.sock"

# FZF settings
$env.FZF_DEFAULT_OPTS = (
  [
    "--scheme=history"
    "--ansi"
    "--exact"
    "--no-mouse"
    "--tac"
    "--layout=reverse"
    "--height=90%"
    "--min-height=7"
    "--prompt=  "
    "--info=inline-right"
    "--border=none"
    "--no-scrollbar"
    "--no-separator"
    "--color=bg:#0d1117,bg+:#161b22,border:#30363d,fg:#c9d1d9,fg+:#f0f6fc,header:#8b949e,hl:#58a6ff,hl+:#58a6ff,info:#8b949e,marker:#d29922,pointer:#d29922,prompt:#d29922,query:#c9d1d9,spinner:#d29922"
  ]
  | str join " "
)

$env.LESS = "-cigRS -j4 -x4 -#5 -z-10"

# PATH order from old setup
if (($env.PATH | describe) == "string") {
  $env.PATH = ($env.PATH | split row (char esep))
}

$env.PATH = (
  $env.PATH
  | append ($env.HOME | path join ".local/bin")
  | append ($env.GOPATH | path join "bin")
  | prepend ($env.HOME | path join ".composer/vendor/bin")
  | prepend ($env.KREW_ROOT | path join "bin")
  | uniq
)

# Runtime init script generation
let autoload_dir = ($nu.data-dir | path join "vendor/autoload")
if not ($autoload_dir | path exists) {
  mkdir $autoload_dir
}

if not ($nu.cache-dir | path exists) {
  mkdir $nu.cache-dir
}

if (which carapace | is-not-empty) {
  carapace _carapace nushell | save --force ($nu.cache-dir | path join "carapace.nu")
}

if (which starship | is-not-empty) {
  starship init nu | save --force ($autoload_dir | path join "starship.nu")
}

if (which zoxide | is-not-empty) {
  zoxide init nushell | save --force ($autoload_dir | path join "zoxide.nu")
}

if (which mise | is-not-empty) {
  let mise_path = ($nu.default-config-dir | path join "mise.nu")
  ^mise activate nu | str replace --all 'str upcase' 'str uppercase' | save --force $mise_path
}
