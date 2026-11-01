#!/bin/sh
# Assemble a flashable SD card image: rg350m-sys.img
#
#   sector 1..16   UBIBoot (rg350 variant)
#   partition 1    FAT32 "boot": uzImage.bin (kernel + rg350m.dtb),
#                  rootfs.squashfs, modules.squashfs, mininit-syspart
#   partition 2    ext4 "system": user data; grown to the full card on
#                  first boot by /etc/init.d/S03adataresize.sh
set -e

BINARIES_DIR=$1
BOARD_DIR=$(dirname "$0")
WORK=$BINARIES_DIR/sdcard
export PATH="$HOST_DIR/bin:$HOST_DIR/sbin:$PATH"

BOOT_MB=400
DATA_MB=256

rm -rf "$WORK"
mkdir -p "$WORK"

# The bootloader expects the device tree appended to the kernel.
cat "$BINARIES_DIR/uzImage.bin" "$BINARIES_DIR/rg350m.dtb" > "$WORK/uzImage.bin"

# Boot partition (FAT32)
BOOT_IMG=$WORK/boot.vfat
rm -f "$BOOT_IMG"
truncate -s ${BOOT_MB}M "$BOOT_IMG"
mkfs.vfat -F 32 -n boot "$BOOT_IMG" > /dev/null
mcopy -i "$BOOT_IMG" "$WORK/uzImage.bin" \
	"$BINARIES_DIR/rootfs.squashfs" \
	"$BINARIES_DIR/modules.squashfs" \
	"$BINARIES_DIR/mininit-syspart" ::/
mmd -i "$BOOT_IMG" ::/dev ::/root

# Data partition (ext4), pre-created folders + readme
DATA_ROOT=$WORK/data-root
mkdir -p "$DATA_ROOT/roms" "$DATA_ROOT/bios" "$DATA_ROOT/local/home"
cp "$BOARD_DIR/README-data.txt" "$DATA_ROOT/README.txt"
DATA_IMG=$WORK/data.ext4
rm -f "$DATA_IMG"
mkfs.ext4 -q -F -L system -E root_owner=0:0 -d "$DATA_ROOT" "$DATA_IMG" ${DATA_MB}M

UBIBOOT=$(ls "$BINARIES_DIR"/ubiboot-rg350*.bin | grep -v stage1 | head -n1)
[ -r "$UBIBOOT" ] || { echo "ubiboot-rg350*.bin not found"; exit 1; }
cp "$UBIBOOT" "$WORK/ubiboot.bin"

cat > "$WORK/genimage.cfg" <<GENIMAGE
image rg350m-sys.img {
	hdimage {
		partition-table-type = "mbr"
	}
	partition ubiboot {
		in-partition-table = false
		image = "ubiboot.bin"
		offset = 512
	}
	partition boot {
		partition-type = 0xC
		bootable = true
		image = "boot.vfat"
		offset = 1M
	}
	partition system {
		partition-type = 0x83
		image = "data.ext4"
	}
}
GENIMAGE

rm -rf "$WORK/genimage.tmp"
genimage --rootpath "$WORK" --tmppath "$WORK/genimage.tmp" \
	--inputpath "$WORK" --outputpath "$BINARIES_DIR" \
	--config "$WORK/genimage.cfg"

rm -f "$BINARIES_DIR/rg350m-sys.img.xz"
xz -T0 -k -6 "$BINARIES_DIR/rg350m-sys.img"

echo
echo "SD card image: $BINARIES_DIR/rg350m-sys.img (.xz)"
