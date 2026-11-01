################################################################################
#
# libretro-o2em
#
################################################################################

LIBRETRO_O2EM_VERSION = 679d6fec04963f6e70a7ec217e3d0ebb1fe472fc
LIBRETRO_O2EM_SITE = $(call github,libretro,libretro-o2em,$(LIBRETRO_O2EM_VERSION))
LIBRETRO_O2EM_LICENSE = Artistic-1.0
LIBRETRO_O2EM_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_O2EM))
$(eval $(generic-package))
