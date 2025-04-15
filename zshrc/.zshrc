##################################
## Jakob's multi-use zsh config ##
##################################

# load oh-my-zsh on devices with it
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "loading oh-my-zsh"
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="jakobj" # https://gist.github.com/jakobottar/f68b43af1ce7276f30fb257c611a1289
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
    export QT_STYLE_OVERRIDE=""
else 
    echo "setting a simple prompt"
    PROMPT='%F{7}%m%f %F{1}::%f %F{2}%B%~%b%f %F{4}>%f '
fi

#### set up zsh autocomplete ####
echo "load autocomplete configs"

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
bindkey -e

#### search through history with arrow keys ####
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

#### misc settings ####
export EDITOR="vim"

#### aliases ####
# general stuff
echo "loading general use aliases"
alias l="ls -lah"

# unlock ssh keychain
eval $(keychain --eval --quiet id_ed25519)

# git
alias gs="git fetch; git status"
alias ga="git add -A; git status"
alias gc="git commit -m"
alias gcf="git commit --fixup"
alias gp="git push"

# docker
alias dcb="docker-compose build"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"

# personal laptop aliases
if [[ "$HOST" == "capitol-reef" ]]; then
    echo "loading 'capitol-reef' aliases and configs"
    alias vpn="protonvpn-cli"
    alias myip="curl ipinfo.io/ip"
    alias shutdown="shutdown now"
    alias p="ping -i 0.2 -O www.utah.edu"
    alias zzz="systemctl hibernate"

    alias ls="eza"
    alias neofetch="flashfetch"

    # borg backup reop
    export BORG_REPO=ssh://jakobj@jakobj.dev//hdd/borg-backup/$HOST

    # Load RVM into a shell session *as a function*
    [[ -s "/usr/share/rvm/scripts/rvm" ]] && source "/usr/share/rvm/scripts/rvm" 
fi

# personal desktop aliases
if [[ "$HOST" == "zion" ]]; then
    echo "loading 'zion' aliases and configs"
    alias myip="curl ipinfo.io/ip"
    alias p="ping -i 0.2 -O www.utah.edu"

    alias ls="eza"
fi

# work aliases
if [[ "$HOST" == "eris" || "$HOST" == "titan" || "$HOST" == "helios" || "$HOST" == "pegasus" || "$HOST" == "compute" || "$HOST" == "chimera" ]]; then
    echo "loading SCI aliases and configs"
    alias myip="curl ipinfo.io/ip"
    alias p="ping -i 0.2 -O www.utah.edu"

    # slurm
    alias sb="sbatch"
    alias sq="squeue -u $USER"
    alias si="sinfo -o '%16P %12n %.6t %.4c %.8z %.6m %12G %10l %11L' --sort=P,n"
    # TODO: these need more work
    # alias sca="scancel -u $USER"
    alias scl="squeue -u $USER -o "%18i" -h | awk 'NR == 1  {print $1}' | xargs scancel" # cancel latest job
fi


if [[ $USER == "john665" ]]; then
    echo "loading PNNL configs"

    # enable https proxy for pip
    export HTTPS_PROXY="http://proxy01.pnl.gov:3128"

    # slurm
    alias sb="sbatch"
    alias sq="squeue -u $USER"
    # TODO: these need more work
    # alias sca="scancel -u $USER"
    alias scl="squeue -u $USER -o "%18i" -h | awk 'NR == 1  {print $1}' | xargs scancel" # cancel latest job

    if [[ "$SYSTEM_NAME" == "deception" ]]; then
        echo "loading 'deception' configs"
        module load cuda/12.1
        module load python/miniconda24.4.0

        source /share/apps/python/miniconda24.4.0/etc/profile.d/conda.sh
    fi
fi

#### mamba (conda replacement) ####
if [ -d $HOME/.micromamba ]; then
    echo "loading mamba configs"
    export PATH="/home/jakobj/.local/bin:$PATH"
    export MAMBA_EXE="$HOME/.local/bin/micromamba";
    export MAMBA_ROOT_PREFIX="$HOME/.micromamba";

    eval "$($MAMBA_EXE shell hook --shell zsh --root-prefix $MAMBA_ROOT_PREFIX)"

    alias m="micromamba"
fi

clear
echo "Welcome, Jakob."
