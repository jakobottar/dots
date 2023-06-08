#! /bin/bash
# usage: backup.sh rclone-repo:

sudo rclone sync /hdd               \
    --include "/samba/**"           \
    --include "/borg-backup/**"     \
    --include "/nc/jakobj/files/**" \
    $1 --transfers=2 --bwlimit=20M
    
status=$?

[ $status -eq 0 ] && echo "successfully backed up to $1"
exit $status
