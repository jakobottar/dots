# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jakobj" # https://gist.github.com/jakobottar/f68b43af1ce7276f30fb257c611a1289
plugins=(git)
source $ZSH/oh-my-zsh.sh
export QT_STYLE_OVERRIDE=""

# aliases
alias vpn="protonvpn-cli"
alias gs="git status"

# python venv activation shortcut
venv-activate() { source $1/bin/activate }

# borg backup
export BORG_REPO=ssh://bacman@jakobj.dev:1985//backups/$HOST

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
