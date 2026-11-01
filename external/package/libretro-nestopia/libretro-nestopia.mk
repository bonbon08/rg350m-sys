################################################################################
#
# libretro-nestopia
#
################################################################################

LIBRETRO_NESTOPIA_VERSION = 2110d21b7174455ec98948bb474147dea0e3cad0
LIBRETRO_NESTOPIA_SITE = $(call github,libretro,nestopia,$(LIBRETRO_NESTOPIA_VERSION))
LIBRETRO_NESTOPIA_LICENSE = GPL-2.0
LIBRETRO_NESTOPIA_SUBDIR = libretro
LIBRETRO_NESTOPIA_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_NESTOPIA))
$(eval $(generic-package))
