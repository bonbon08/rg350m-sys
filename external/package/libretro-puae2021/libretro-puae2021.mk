################################################################################
#
# libretro-puae2021
#
################################################################################

LIBRETRO_PUAE2021_VERSION = 83e6e546557dcd79d2edca39956f4c12cdcc8bed
LIBRETRO_PUAE2021_SITE = $(call github,libretro,libretro-uae,$(LIBRETRO_PUAE2021_VERSION))
LIBRETRO_PUAE2021_LICENSE = GPL-2.0

$(eval $(call libretro-core-setup,LIBRETRO_PUAE2021))
$(eval $(generic-package))

