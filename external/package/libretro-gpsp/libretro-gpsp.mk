################################################################################
#
# libretro-gpsp
#
################################################################################

LIBRETRO_GPSP_VERSION = 5819380c2ffb0900219d700a382ee68c464ebb99
LIBRETRO_GPSP_SITE = $(call github,libretro,gpsp,$(LIBRETRO_GPSP_VERSION))
LIBRETRO_GPSP_LICENSE = GPL-2.0
LIBRETRO_GPSP_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_GPSP))
$(eval $(generic-package))
