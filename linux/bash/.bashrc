# ~/.bashrc

[[ $- != *i* ]] && return

# Update directory paths
for directory in "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/Applications/depot_tools" "$HOME/.lmstudio/bin"; do
    [[ -d $directory && :$PATH: != *:"$directory":* ]] && PATH="$directory:$PATH"
done
export PATH
unset directory

# CachyOS fish man-page settings.
export MANROFFOPT='-c'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Fish's timed history has a close Bash equivalent. Bash already supports !! and !$.
HISTTIMEFORMAT='%F %T '

# Keep a usable prompt until Starship is installed.
PS1='[\u@\h \W]\$ '
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Aliases
alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'
alias ls='ls --color'
alias ll='ls -al'
alias cat='bat'
alias find='fd'
alias t='tmux'
alias oc='opencode'
alias qf='rg --color=always --line-number --no-heading --smart-case "" | fzf --ansi --delimiter : --preview "bat --style=full --color=always --highlight-line {2} {1}"'
alias qff='fzf --ansi --delimiter : --preview "bat --style=full --color=always --highlight-line {2} {1}"'
alias gam='git commit -a -m'
alias gf='git fetch'
alias gl='git log'
alias gm='git commit -m'
alias gp='git pull'
alias gpu='git push'
alias gst='git status'

# Cachy Aliases
alias la='eza -a --color=always --group-directories-first --icons=always'
alias lt='eza -aT --color=always --group-directories-first --icons=always'
alias l.="eza -a | grep -e '^\\.'"
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'
alias big="expac -H M '%m\\t%n' | sort -h | nl"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias update='sudo cachyos-rate-mirrors && sudo pacman -Syu'
alias mirror='sudo cachyos-rate-mirrors'
alias apt='man pacman'
alias apt-get='man pacman'
alias tb='nc termbin.com 9999'
alias jctl='journalctl -p 3 -xb'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\\t%n %v' | sort | tail -200 | nl"

backup() {
    [[ $# -eq 1 ]] || return 2
    cp -- "$1" "$1.bak"
}

copy() {
    if [[ $# -eq 2 && -d $1 ]]; then
        command cp -r -- "${1%/}" "$2"
    else
        command cp -- "$@"
    fi
}

cleanup() {
    local -a orphans
    mapfile -t orphans < <(pacman -Qtdq)
    ((${#orphans[@]})) && sudo pacman -Rns "${orphans[@]}"
}

# Match the fish greeting when fastfetch is available.
if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi
