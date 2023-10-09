#!/bin/bash

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=ssh://jakobj@jakobj.dev//hdd/borg-backup/{hostname}

# get config from ~/.config/scripts.conf
. ~/.config/scripts.conf

# See the section "Passphrase notes" for more infos.
export BORG_PASSPHRASE=$borg_passphrase

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Saving list of installed packages"

tar -cjf ~/.config/pacman/pacman-database.tar.bz2 /var/lib/pacman/local
pacman -Q > ~/.config/pacman/pacman-installed.txt

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                             \
    --verbose                           \
    --filter AME                        \
    --list                              \
    --stats                             \
    --show-rc                           \
    --compression lz4                   \
    --exclude-caches                    \
    --exclude 'home/*/.cache/*'         \
    --exclude 'home/*/nextcloud/*'      \
    --exclude 'home/*/.config/borg/*'   \
    --exclude 'home/*/.config/Slack/*'  \
    --exclude 'home/*/.config/Signal/*' \
    --exclude 'home/*/.config/Code/*'   \
    --exclude 'home/*/.mozilla/*'       \
                                        \
    ::'{hostname}-{now}'                \
    /home

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of this machine.

borg prune                          \
    --list                          \
    --glob-archives '{hostname}-*'  \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6

prune_exit=$?

# actually free repo disk space by compacting segments

info "Compacting repository"

borg compact

compact_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))
global_exit=$(( compact_exit > global_exit ? compact_exit : global_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup, Prune, and Compact finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup, Prune, and/or Compact finished with warnings"
else
    info "Backup, Prune, and/or Compact finished with errors"
fi

exit ${global_exit}
