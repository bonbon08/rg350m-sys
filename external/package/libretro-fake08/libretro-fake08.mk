################################################################################
#
# libretro-fake08
#
################################################################################

LIBRETRO_FAKE08_VERSION = 814991a2571ad3970e386cef48f3b148aa1c27b9
LIBRETRO_FAKE08_SITE = https://github.com/jtothebell/fake-08.git
LIBRETRO_FAKE08_SITE_METHOD = git
LIBRETRO_FAKE08_GIT_SUBMODULES = YES
LIBRETRO_FAKE08_LICENSE = MIT
LIBRETRO_FAKE08_SUBDIR = platform/libretro

$(eval $(call libretro-core-setup,LIBRETRO_FAKE08))
$(eval $(generic-package))

