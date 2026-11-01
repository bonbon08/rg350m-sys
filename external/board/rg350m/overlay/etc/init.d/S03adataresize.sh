#!/bin/sh
# First boot: grow the data partition (the one after the system partition)
# to fill the SD card. Runs before S03mountdata.sh, while it is unmounted.

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

BOOT_PARTITION=$(sed -n 's/.*root=\([[:alnum:]:\/]\+\).*/\1/p' /proc/cmdline)
case "$BOOT_PARTITION" in
	/dev/mmcblk*p[0-9]) ;;
	*) exit 0 ;;
esac

DISK=${BOOT_PARTITION%p*}
PARTNUM=$(expr ${BOOT_PARTITION##*p} + 1)
DATA=${DISK}p${PARTNUM}
NAME=${DATA##*/}

[ -b "$DATA" ] || exit 0
[ "$(blkid_fs $DATA)" = ext4 ] || exit 0

DISK_SECTORS=$(cat /sys/block/${DISK##*/}/size)
START=$(cat /sys/block/${DISK##*/}/$NAME/start)
SIZE=$(cat /sys/block/${DISK##*/}/$NAME/size)

# Less than 16 MiB left unused at the end: nothing to do.
[ $(expr $DISK_SECTORS - $START - $SIZE) -lt 32768 ] && exit 0

psplash_write "Expanding data partition..."

echo ", +" | sfdisk --no-reread --no-tell-kernel -N $PARTNUM $DISK >/dev/null 2>&1 || exit 0
partx -u -n $PARTNUM $DISK
e2fsck -f -y $DATA >/dev/null 2>&1
resize2fs $DATA >/dev/null 2>&1
