################################################################################
#
# libretro-potator
#
################################################################################

LIBRETRO_POTATOR_VERSION = 227c5f6f3ce74d32e9002ce24c1420288559a860
LIBRETRO_POTATOR_SITE = $(call github,libretro,potator,$(LIBRETRO_POTATOR_VERSION))
LIBRETRO_POTATOR_LICENSE = Unlicense
LIBRETRO_POTATOR_SUBDIR = platform/libretro
LIBRETRO_POTATOR_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_POTATOR))
$(eval $(generic-package))
