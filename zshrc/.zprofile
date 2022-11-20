# launch ssh-agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" > /dev/null

# gpg
export GPG_TTY=$(tty)

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# launch sway from login shell
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
