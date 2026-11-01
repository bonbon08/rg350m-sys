################################################################################
#
# libretro-fceumm
#
################################################################################

LIBRETRO_FCEUMM_VERSION = ac0d00a7fc01166f84c7bac01d1084ebfd2b865e
LIBRETRO_FCEUMM_SITE = $(call github,libretro,libretro-fceumm,$(LIBRETRO_FCEUMM_VERSION))
LIBRETRO_FCEUMM_LICENSE = GPL-2.0
LIBRETRO_FCEUMM_MAKEFILE = Makefile.libretro
LIBRETRO_FCEUMM_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_FCEUMM))
$(eval $(generic-package))
