# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jakobj" # https://gist.github.com/jakobottar/f68b43af1ce7276f30fb257c611a1289
plugins=(git)
source $ZSH/oh-my-zsh.sh
export QT_STYLE_OVERRIDE=""

# aliases
alias gs='git fetch; git status'
alias ga='git add -A; git status'
alias gc='git commit -S -m'
alias gcf='git commit -S --fixup'
alias gp='git push'

alias dcb='docker-compose build'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

alias sb='sbatch'
alias sq='squeue -u u0972673'

alias vpn='protonvpn-cli'
alias myip='curl ipinfo.io/ip'
alias shutdown='shutdown now'
alias p='ping -i 0.2 -O www.utah.edu'
alias zzz='systemctl hibernate'
alias todo='vim ~/TODO.txt'

alias ls='eza'
alias neofetch='flashfetch'

# borg backup
export BORG_REPO=ssh://jakobj@jakobj.dev//hdd/borg-backup/$HOST

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# launch keychain
eval $(keychain --eval --quiet id_ed25519)
