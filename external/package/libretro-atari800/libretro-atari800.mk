################################################################################
#
# libretro-atari800
#
################################################################################

LIBRETRO_ATARI800_VERSION = 4e7fbc73765c1a9670c7506616046ad1d4ccda51
LIBRETRO_ATARI800_SITE = $(call github,libretro,libretro-atari800,$(LIBRETRO_ATARI800_VERSION))
LIBRETRO_ATARI800_LICENSE = GPL-2.0
LIBRETRO_ATARI800_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_ATARI800))
$(eval $(generic-package))
