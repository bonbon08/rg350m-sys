################################################################################
#
# libretro-freeintv
#
################################################################################

LIBRETRO_FREEINTV_VERSION = ef3e0fe322bec62a7f916c0bb0834c08c348d0b4
LIBRETRO_FREEINTV_SITE = $(call github,libretro,FreeIntv,$(LIBRETRO_FREEINTV_VERSION))
LIBRETRO_FREEINTV_LICENSE = GPL-3.0
LIBRETRO_FREEINTV_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_FREEINTV))
$(eval $(generic-package))
