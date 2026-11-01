################################################################################
#
# libretro-prosystem
#
################################################################################

LIBRETRO_PROSYSTEM_VERSION = 8a88014287c7a01cd568067e5a557d0a2b2a051f
LIBRETRO_PROSYSTEM_SITE = $(call github,libretro,prosystem-libretro,$(LIBRETRO_PROSYSTEM_VERSION))
LIBRETRO_PROSYSTEM_LICENSE = GPL-2.0
LIBRETRO_PROSYSTEM_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_PROSYSTEM))
$(eval $(generic-package))
