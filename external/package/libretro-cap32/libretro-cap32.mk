################################################################################
#
# libretro-cap32
#
################################################################################

LIBRETRO_CAP32_VERSION = 8e61dd69d948cea16c3bad734f7b9d0c2a018cc8
LIBRETRO_CAP32_SITE = $(call github,libretro,libretro-cap32,$(LIBRETRO_CAP32_VERSION))
LIBRETRO_CAP32_LICENSE = GPL-2.0

$(eval $(call libretro-core-setup,LIBRETRO_CAP32))
$(eval $(generic-package))
