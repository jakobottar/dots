###################################
## Jakob's multi-use bash config ##
###################################

#### prompt ####
# gray hostname :: bold green cwd blue >
PS1='\[\e[37m\]\h\[\e[0m\] \[\e[31m\]::\[\e[0m\] \[\e[32m\]\[\e[1m\]\w\[\e[0m\] \[\e[34m\]>\[\e[0m\] '

#### bash completion ####
echo "load autocomplete configs"
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

HISTFILE=~/.histfile
HISTSIZE=2000
HISTFILESIZE=2000

#### search through history with arrow keys ####
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#### misc settings ####
export EDITOR="vim"

#### aliases ####
# general stuff
echo "loading general use aliases"
alias l="ls -lah"
alias myip="curl ipinfo.io/ip"
alias p="ping -i 0.2 -O www.utah.edu"

# git
alias gs="git fetch; git status"
alias ga="git add -A; git status"
alias gc="git commit -m"
alias gcf="git commit --fixup"
alias gp="git push"

# personal laptop aliases
if [[ "$HOSTNAME" == "capitol-reef" ]]; then
    echo "loading 'capitol-reef' aliases and configs"
    alias vpn="protonvpn-cli"
    alias shutdown="shutdown now"
    alias zzz="systemctl hibernate"

    alias ls="eza"
    alias neofetch="flashfetch"

    # unlock ssh keychain
    eval $(keychain --eval --quiet id_ed25519)

    # borg backup repo
    export BORG_REPO=ssh://jakobj@jakobj.dev//hdd/borg-backup/$HOSTNAME

    # Load RVM into a shell session *as a function*
    [[ -s "/usr/share/rvm/scripts/rvm" ]] && source "/usr/share/rvm/scripts/rvm"
fi

# personal desktop aliases
if [[ "$HOSTNAME" == "zion" ]]; then
    echo "loading 'zion' aliases and configs"
    alias ls="eza"
fi

# work aliases
if [[ "$HOSTNAME" == "compute" ]]; then
    echo "loading SCI Compute aliases and configs"

    # slurm
    alias sb="sbatch"
    alias squeue="squeue -o '%.8i %.9P %.10j %.8u %.2t %.10M %.10l %R' --sort=P"
    alias sq="sjobs -u $USER"
    alias si="sinfo -o '%16P %12n %.6t %.4c %.8z %16G %10l' --sort=P,n"

    # cancel latest job
    scl() { squeue -u $USER -h -o "%.18i %.2t" | awk '$2 != "CG" {print $1}' | sort -n | tail -1 | xargs scancel; }
fi

# darwin frontend node aliases
if [[ "$HOSTNAME" == darwin-fe* ]]; then
    echo "loading Darwin aliases and configs"

    # slurm
    alias sb="sbatch"
    alias squeue="squeue -o '%.8i %.9P %.10j %.8u %.2t %.10M %.10l %R' --sort=P"
    alias sq="squeue -u $USER"
    alias si="sinfo -o '%16P %12n %.6t %.4c %.8z %16G %10l' --sort=P,n"

    # cancel latest job
    scl() { squeue -u $USER -h -o "%.18i %.2t" | awk '$2 != "CG" {print $1}' | sort -n | tail -1 | xargs scancel; }
fi

#### mamba (conda replacement) ####
if [ -d $HOME/.micromamba ]; then
    echo "loading mamba configs"
    export PATH="/home/jakobj/.local/bin:$PATH"
    export MAMBA_EXE="$HOME/.local/bin/micromamba"
    export MAMBA_ROOT_PREFIX="$HOME/.micromamba"

    eval "$($MAMBA_EXE shell hook --shell bash --root-prefix $MAMBA_ROOT_PREFIX)"

    alias m="micromamba"
fi

clear
echo "Welcome, Jakob."
