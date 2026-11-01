################################################################################
#
# libretro-fuse
#
################################################################################

LIBRETRO_FUSE_VERSION = e997e2bc32c888348f862f69f2c53babfedf7791
LIBRETRO_FUSE_SITE = $(call github,libretro,fuse-libretro,$(LIBRETRO_FUSE_VERSION))
LIBRETRO_FUSE_LICENSE = GPL-3.0

$(eval $(call libretro-core-setup,LIBRETRO_FUSE))
$(eval $(generic-package))
