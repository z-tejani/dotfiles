#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Install startship
# curl -sS https://starship.rs/install.sh | sh

echo 'eval "$(starship init bash)"' >> ~/.bashrc

# Aliases
alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -al'
alias ls='ls --color'

alias cat=bat
alias find=fd
alias t=tmux
alias oc=opencode
alias qf='rg --color=always --line-number --no-heading --smart-case "" | fzf --ansi --delimiter : --preview "bat --style=full --color=always --highlight-line {2} {1}"'
alias qff='fzf --ansi --delimiter : --preview "bat --style=full --color=always --highlight-line {2} {1}"'

alias gam='git commit -a -m'
alias gf='git fetch'
alias gl='git log'
alias gm='git commit -m'
alias gp='git pull'
alias gpu='git push'
alias gst='git status'

eval "$(starship init bash)"
eval "$(starship init bash)"
eval "$(starship init bash)"
eval "$(starship init bash)"
