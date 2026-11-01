################################################################################
#
# libretro-vecx
#
################################################################################

LIBRETRO_VECX_VERSION = dccff5402a16d1ea7c112095a8e42632bf149506
LIBRETRO_VECX_SITE = $(call github,libretro,libretro-vecx,$(LIBRETRO_VECX_VERSION))
LIBRETRO_VECX_LICENSE = GPL-3.0

LIBRETRO_VECX_MAKE_OPTS = HAS_GPU=0

$(eval $(call libretro-core-setup,LIBRETRO_VECX))
$(eval $(generic-package))
