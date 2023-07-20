## ssh keys

get ssh public keys from GitHub

```bash
curl https://github.com/username.keys | tee ~/.ssh/authorized_keys
```

## compression

tar zip with all cpus:

```bash
tar -c -I 'xz -6 -T0' -f archive.tar.xz dir/
```

## tmux

```
Ctrl-B -> manage tmux
Ctrl-B, X -> exit tmux
Ctrl-B, D -> detach tmux
Ctrl-B, S -> see other sessions
Ctrl-B, $ -> rename session
Ctrl-B, " -> split horizontally
Ctrl-B, % -> split vertically
Ctrl-B, Q -> show tile names
```

## permissions

Remove other's permissions for a directory:

```bash
chgrp -R nfs dir/
chmod -R o-rwx dir/
```
