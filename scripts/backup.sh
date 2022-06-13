#! /bin/bash

rclone sync /home/jakobj/samba/ opdi-crypt: --transfers=2 --bwlimit=20M
