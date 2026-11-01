################################################################################
#
# libretro-vice
#
################################################################################

LIBRETRO_VICE_VERSION = 5ebe7d333ab15be57a9dde5f46c29a5bbd5f44f8
LIBRETRO_VICE_SITE = $(call github,libretro,vice-libretro,$(LIBRETRO_VICE_VERSION))
LIBRETRO_VICE_LICENSE = GPL-2.0
LIBRETRO_VICE_PLATFORM = gcw0
LIBRETRO_VICE_MAKE_OPTS = EMUTYPE=x64

$(eval $(call libretro-core-setup,LIBRETRO_VICE))
$(eval $(generic-package))

