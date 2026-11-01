################################################################################
#
# libretro-picodrive
#
################################################################################

LIBRETRO_PICODRIVE_VERSION = 1890c2932234c9d30f4cd3851d02228baae8f09e
LIBRETRO_PICODRIVE_SITE = https://github.com/libretro/picodrive.git
LIBRETRO_PICODRIVE_SITE_METHOD = git
LIBRETRO_PICODRIVE_GIT_SUBMODULES = YES
LIBRETRO_PICODRIVE_LICENSE = PicoDrive (non-commercial)
LIBRETRO_PICODRIVE_MAKEFILE = Makefile.libretro
LIBRETRO_PICODRIVE_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_PICODRIVE))
$(eval $(generic-package))
