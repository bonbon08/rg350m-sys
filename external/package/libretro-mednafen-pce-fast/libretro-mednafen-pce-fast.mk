################################################################################
#
# libretro-mednafen-pce-fast
#
################################################################################

LIBRETRO_MEDNAFEN_PCE_FAST_VERSION = 4eee99c451f85ebe66d1591de88b892015b23059
LIBRETRO_MEDNAFEN_PCE_FAST_SITE = $(call github,libretro,beetle-pce-fast-libretro,$(LIBRETRO_MEDNAFEN_PCE_FAST_VERSION))
LIBRETRO_MEDNAFEN_PCE_FAST_LICENSE = GPL-2.0
LIBRETRO_MEDNAFEN_PCE_FAST_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_MEDNAFEN_PCE_FAST))
$(eval $(generic-package))
