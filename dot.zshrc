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

