################################################################################
#
# libretro-mame2003-plus
#
################################################################################

LIBRETRO_MAME2003_PLUS_VERSION = ff5f1bd024423fac4f31927488c2f54f7b72c86f
LIBRETRO_MAME2003_PLUS_SITE = $(call github,libretro,mame2003-plus-libretro,$(LIBRETRO_MAME2003_PLUS_VERSION))
LIBRETRO_MAME2003_PLUS_LICENSE = MAME (non-commercial)
LIBRETRO_MAME2003_PLUS_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_MAME2003_PLUS))
$(eval $(generic-package))
