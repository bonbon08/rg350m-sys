################################################################################
#
# libretro-stella2014
#
################################################################################

LIBRETRO_STELLA2014_VERSION = 7d1361e407e63f29e52892655069e5fb4096e691
LIBRETRO_STELLA2014_SITE = $(call github,libretro,stella2014-libretro,$(LIBRETRO_STELLA2014_VERSION))
LIBRETRO_STELLA2014_LICENSE = GPL-2.0
LIBRETRO_STELLA2014_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_STELLA2014))
$(eval $(generic-package))
