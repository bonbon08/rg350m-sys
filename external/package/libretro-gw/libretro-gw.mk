################################################################################
#
# libretro-gw
#
################################################################################

LIBRETRO_GW_VERSION = 91d599b951e7bfe7e040347f58667cba20074adc
LIBRETRO_GW_SITE = $(call github,libretro,gw-libretro,$(LIBRETRO_GW_VERSION))
LIBRETRO_GW_LICENSE = Zlib

$(eval $(call libretro-core-setup,LIBRETRO_GW))
$(eval $(generic-package))
