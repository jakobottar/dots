#!/bin/sh

yaycache="$(find $(su jakobj -c "yay -Pg" | jq -r .buildDir) -maxdepth 1 -type d | awk '{ print "-c " $1 }' | tail -n +2)"
/usr/bin/paccache -ruk0 -c /var/cache/pacman/pkg $yaycache
