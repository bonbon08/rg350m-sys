################################################################################
#
# libretro-snes9x2002
#
################################################################################

LIBRETRO_SNES9X2002_VERSION = 6ffbf9ef4f0063e1f1b78a40d10c50fc52f2524c
LIBRETRO_SNES9X2002_SITE = $(call github,libretro,snes9x2002,$(LIBRETRO_SNES9X2002_VERSION))
LIBRETRO_SNES9X2002_LICENSE = Snes9x (non-commercial)
LIBRETRO_SNES9X2002_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_SNES9X2002))
$(eval $(generic-package))
