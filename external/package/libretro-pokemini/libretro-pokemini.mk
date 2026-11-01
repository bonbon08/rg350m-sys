################################################################################
#
# libretro-pokemini
#
################################################################################

LIBRETRO_POKEMINI_VERSION = 132111b76343559860532a1ccc094f93f1ed5650
LIBRETRO_POKEMINI_SITE = $(call github,libretro,PokeMini,$(LIBRETRO_POKEMINI_VERSION))
LIBRETRO_POKEMINI_LICENSE = GPL-3.0

$(eval $(call libretro-core-setup,LIBRETRO_POKEMINI))
$(eval $(generic-package))
