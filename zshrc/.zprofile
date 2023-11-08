# launch ssh-agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" > /dev/null
[ -z "$TMUX" ] && trap 'test -n "$SSH_AGENT_PID" && eval `/usr/bin/ssh-agent -k` > /dev/null' 0

# gpg
export GPG_TTY=$(tty)

# launch sway from login shell
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi

# add ~/.local/bin to $PATH
PATH=$HOME/.local/bin:$PATH
