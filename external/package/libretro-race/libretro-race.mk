################################################################################
#
# libretro-race
#
################################################################################

LIBRETRO_RACE_VERSION = c7810dd7f172827bfa2004813bc000b13786636b
LIBRETRO_RACE_SITE = $(call github,libretro,RACE,$(LIBRETRO_RACE_VERSION))
LIBRETRO_RACE_LICENSE = GPL-2.0
LIBRETRO_RACE_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_RACE))
$(eval $(generic-package))
