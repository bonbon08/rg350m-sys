################################################################################
#
# libretro-prboom
#
################################################################################

LIBRETRO_PRBOOM_VERSION = 4849268e7342494193f2bbf2d0128a751cf58da7
LIBRETRO_PRBOOM_SITE = $(call github,libretro,libretro-prboom,$(LIBRETRO_PRBOOM_VERSION))
LIBRETRO_PRBOOM_LICENSE = GPL-2.0
LIBRETRO_PRBOOM_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_PRBOOM))
$(eval $(generic-package))
