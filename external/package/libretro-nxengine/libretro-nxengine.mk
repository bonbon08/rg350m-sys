################################################################################
#
# libretro-nxengine
#
################################################################################

LIBRETRO_NXENGINE_VERSION = fd1c0686f8b4c0aea9b5addbc077e3ad7da23bb7
LIBRETRO_NXENGINE_SITE = $(call github,libretro,nxengine-libretro,$(LIBRETRO_NXENGINE_VERSION))
LIBRETRO_NXENGINE_LICENSE = GPL-3.0
LIBRETRO_NXENGINE_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_NXENGINE))
$(eval $(generic-package))
