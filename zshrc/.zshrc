# oh-my-zsh stuff
export ZSH="/home/jakobj/.oh-my-zsh"
ZSH_THEME="jakobj" # https://gist.github.com/jakobottar/f68b43af1ce7276f30fb257c611a1289
plugins=(git)
source $ZSH/oh-my-zsh.sh
export QT_STYLE_OVERRIDE=""

# aliases
alias vpn="protonvpn-cli"
alias gs="git status"
alias ca="conda activate"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jakobj/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jakobj/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jakobj/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jakobj/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

neofetch
