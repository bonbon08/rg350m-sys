################################################################################
#
# libretro-gambatte
#
################################################################################

LIBRETRO_GAMBATTE_VERSION = 7809bb68ee96c3e6c74e9d9c4c8bb09aa7c6801d
LIBRETRO_GAMBATTE_SITE = $(call github,libretro,gambatte-libretro,$(LIBRETRO_GAMBATTE_VERSION))
LIBRETRO_GAMBATTE_LICENSE = GPL-2.0

$(eval $(call libretro-core-setup,LIBRETRO_GAMBATTE))
$(eval $(generic-package))
