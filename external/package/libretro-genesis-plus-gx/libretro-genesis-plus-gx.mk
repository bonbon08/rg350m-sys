################################################################################
#
# libretro-genesis-plus-gx
#
################################################################################

LIBRETRO_GENESIS_PLUS_GX_VERSION = 60bee4c724859710ce05672239e5b601ad01382e
LIBRETRO_GENESIS_PLUS_GX_SITE = $(call github,libretro,Genesis-Plus-GX,$(LIBRETRO_GENESIS_PLUS_GX_VERSION))
LIBRETRO_GENESIS_PLUS_GX_LICENSE = Genesis Plus GX (non-commercial)
LIBRETRO_GENESIS_PLUS_GX_MAKEFILE = Makefile.libretro
LIBRETRO_GENESIS_PLUS_GX_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_GENESIS_PLUS_GX))
$(eval $(generic-package))
