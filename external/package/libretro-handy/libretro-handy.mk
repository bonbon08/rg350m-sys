################################################################################
#
# libretro-handy
#
################################################################################

LIBRETRO_HANDY_VERSION = bc55d462f0b2d6b073ea93dc552ebd73cec60fd1
LIBRETRO_HANDY_SITE = $(call github,libretro,libretro-handy,$(LIBRETRO_HANDY_VERSION))
LIBRETRO_HANDY_LICENSE = Zlib
LIBRETRO_HANDY_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_HANDY))
$(eval $(generic-package))
