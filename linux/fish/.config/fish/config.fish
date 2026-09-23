source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/zain/.lmstudio/bin
# End of LM Studio CLI section

# Aliases copied from ~/.bashrc (last definition wins).
alias vi 'nvim'
alias vim 'nvim'
alias grep 'grep --color=auto'
alias ls 'ls --color'
alias ll 'ls -al'
alias cat 'bat'
alias find 'fd'
alias t 'tmux'
alias oc 'opencode'
alias qf 'rg --color=always --line-number --no-heading --smart-case "" | fzf --ansi --delimiter : --preview "bat --style=full --color=always --highlight-line {2} {1}"'
alias qff 'fzf --ansi --delimiter : --preview "bat --style=full --color=always --highlight-line {2} {1}"'
alias gam 'git commit -a -m'
alias gf 'git fetch'
alias gl 'git log'
alias gm 'git commit -m'
alias gp 'git pull'
alias gpu 'git push'
alias gst 'git status'
