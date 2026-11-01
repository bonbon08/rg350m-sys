#!/bin/sh
# Post-build fixups for RG350M-SYS. $1 = target directory.
set -e
TARGET_DIR=$1

chmod 0440 "$TARGET_DIR/etc/sudoers"

# GMenu2X is still installed (Tools menu), but EmulationStation is the
# frontend; make sure our frontend_start won over the OpenDingux one.
grep -q rg350m-frontend "$TARGET_DIR/usr/sbin/frontend_start"

ls "$TARGET_DIR"/usr/lib/libretro/*_libretro.so > /dev/null
