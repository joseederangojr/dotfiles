use std "path add"

path add $"($env.HOME)/.local/bin"
path add $"($env.HOME)/go/bin"
path add /Users/Shared/DBngin/mysql/8.0.33/bin
path add /Users/Shared/DBngin/postgresql/17.0/bin
path add /Users/Shared/DBngin/redis/7.0.0/bin
$env.XDG_HOME_CONFIG = $"($env.HOME)/.config"
$env.STARSHIP_CACHE = $"($env.XDG_HOME_CONFIG)/starship/cache"
$env.STARSHIP_CONFIG = $"($env.XDG_HOME_CONFIG)/starship/starship.toml"
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"
$env.HOMEBREW_PREFIX = "/opt/homebrew/bin"
$env.DYLD_FALLBACK_LIBRARY_PATH ++ [
  $"($env.HOMEBREW_PREFIX)/lib"
]

$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"
$env.STARSHIP_CONFIG = "~/.config/starship.toml"
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional

$env.DOCKER_HOST = $"unix://($env.HOME)/.colima/default/docker.sock"

