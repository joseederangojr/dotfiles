use std "path add"

source ~/.config/nushell/env.nu

path add /opt/homebrew/bin

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ~/.zoxide.nu

mkdir ~/.cache/carapace 
carapace _carapace nushell | save --force  ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu
