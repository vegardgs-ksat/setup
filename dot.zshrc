###
### Environment
###

# Bring in all rust paths
source "$HOME/.cargo/env"

# Configure starship command line prompt
eval "$(starship init zsh)"

export EDITOR=vim

# rustlang
export PATH="$PATH:/$HOME/.cargo/bin"
export STARSHIP_CONFIG="$HOME/.starship.toml"

# bring macOS libpg into path (for psql)
export PATH="$PATH:/opt/homebrew/opt/libpq/bin"


###
### Alias
###

alias less="less -S"
alias ls="ls --color"
alias ll="ls -ltra --color"
alias tree="erd"

alias az-vm-prod="az network bastion ssh \
  --name bas-vnet-shared-prod-kogs \
  --resource-group rg-shared-prod-kogs \
  --target-resource-id /subscriptions/31cf1aaa-6bc6-4231-8dc1-7c9ca709c559/resourceGroups/rg-shared-prod-kogs/providers/Microsoft.Compute/virtualMachines/vm-jumphost-prod-kogs \
  --auth-type ssh-key \
  --username kogsadmin \
  --ssh-key ~/.ssh/id_ed25519"
alias az-vm-preprod="az network bastion ssh \
  --name bas-vnet-shared-preprod-kogs \
  --resource-group rg-shared-preprod-kogs \
  --target-resource-id /subscriptions/d95b0a42-98b6-4180-8175-f2d49e8ca103/resourceGroups/rg-shared-preprod-kogs/providers/Microsoft.Compute/virtualMachines/vm-jumphost-preprod-kogs \
  --auth-type ssh-key \
  --username kogsadmin \
  --ssh-key ~/.ssh/id_ed25519"
alias az-vm-test="az network bastion ssh \
  --name bas-vnet-shared-test-kogs \
  --resource-group rg-shared-test-kogs \
  --target-resource-id /subscriptions/0f5bb71f-7d0d-4c99-ba91-24a33706170f/resourceGroups/rg-shared-test-kogs/providers/Microsoft.Compute/virtualMachines/vm-jumphost-test-kogs \
  --auth-type ssh-key \
  --username kogsadmin \
  --ssh-key ~/.ssh/id_ed25519"
alias az-vm-dev="az network bastion ssh \
  --name bas-vnet-shared-dev-kogs \
  --resource-group rg-shared-dev-kogs \
  --target-resource-id /subscriptions/e81ec40d-f9d6-4b34-9d5c-fc9e20cf141f/resourceGroups/rg-shared-dev-kogs/providers/Microsoft.Compute/virtualMachines/vm-jumphost-dev-kogs \
  --auth-type ssh-key \
  --username kogsadmin \
  --ssh-key ~/.ssh/id_ed25519"


alias az-vm-prod-tunnel="az network bastion tunnel\
  --name bas-vnet-shared-prod-kogs \
  --resource-group rg-shared-prod-kogs \
  --target-resource-id /subscriptions/31cf1aaa-6bc6-4231-8dc1-7c9ca709c559/resourceGroups/rg-shared-prod-kogs/providers/Microsoft.Compute/virtualMachines/vm-jumphost-prod-kogs \
  --resource-port 22 \
  --port 50022"


###
### Terminal Multiplexer
###

eval "$(zellij setup --generate-auto-start zsh)"


###
### Behaviour and Interaction
###

# bind CTRL-R to reverse history search
bindkey '^R' history-incremental-search-backward

# Intelligent tab completions
autoload -U compinit
compinit

# Set keys from terminfo
typeset -g -A key

key[Home]=${terminfo[khome]}
key[Home]="^[[H" # Override for macOS.
key[End]=${terminfo[kend]}
key[End]="^[[F" # Override for macOS

key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

## setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char


## Finally, make sure the terminal is in application mode, when zle is
## active. Only then are the values from $terminfo valid.
function zle-line-init () {
  echoti smkx
}
function zle-line-finish () {
  echoti rmkx
}

if [ -n "${DISPLAY:-}" ]; then
  zle -N zle-line-init
  zle -N zle-line-finish
fi


. "$HOME/.local/bin/env"
