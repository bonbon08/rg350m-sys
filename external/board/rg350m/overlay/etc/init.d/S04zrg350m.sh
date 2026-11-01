#!/bin/sh
# Folders for ROMs and BIOS files on the data partition.

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

mkdir -p /media/data/roms /media/data/bios
chown od:users /media/data/roms /media/data/bios
