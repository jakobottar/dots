# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jakobj" # https://gist.github.com/jakobottar/f68b43af1ce7276f30fb257c611a1289
plugins=(git)
source $ZSH/oh-my-zsh.sh
export QT_STYLE_OVERRIDE=""

# aliases
alias vpn='protonvpn-cli'
alias gs='git fetch; git status'
alias ga='git add -A; git status'
alias gc='git commit -S'
alias gcf='git commit -S --fixup'
alias gp='git push'
alias myip='curl ipinfo.io/ip'
alias shutdown='shutdown now'
alias p='ping -i 0.2 -O sci.utah.edu'
alias zzz='systemctl hibernate'
alias todo='vim ~/TODO.txt'

alias ls='exa'
alias neofetch='flashfetch'

# borg backup
export BORG_REPO=ssh://bacman@jakobj.dev:1985//backups/$HOST

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

