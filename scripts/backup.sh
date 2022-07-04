#! /bin/bash
# usage: backup.sh rclone-repo:

rclone sync /home/jakobj/samba/ $1 --transfers=2 --bwlimit=20M
status=$?

[ $status -eq 0 ] && echo "successfully backed up to $1"
exit $status
