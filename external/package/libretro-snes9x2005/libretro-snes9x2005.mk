################################################################################
#
# libretro-snes9x2005
#
################################################################################

LIBRETRO_SNES9X2005_VERSION = a79dfe9047e7fec58808aefe48ad2bf499c7af11
LIBRETRO_SNES9X2005_SITE = $(call github,libretro,snes9x2005,$(LIBRETRO_SNES9X2005_VERSION))
LIBRETRO_SNES9X2005_LICENSE = Snes9x (non-commercial)
LIBRETRO_SNES9X2005_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_SNES9X2005))
$(eval $(generic-package))
