################################################################################
#
# libretro-pcsx-rearmed
#
################################################################################

LIBRETRO_PCSX_REARMED_VERSION = 050995286239a066f7cfaf74900350b697161a80
LIBRETRO_PCSX_REARMED_SITE = https://github.com/libretro/pcsx_rearmed.git
LIBRETRO_PCSX_REARMED_SITE_METHOD = git
LIBRETRO_PCSX_REARMED_GIT_SUBMODULES = YES
LIBRETRO_PCSX_REARMED_LICENSE = GPL-2.0
LIBRETRO_PCSX_REARMED_MAKEFILE = Makefile.libretro
LIBRETRO_PCSX_REARMED_MAKE_OPTS = ARCH=mips DYNAREC=lightrec BUILTIN_GPU=unai

$(eval $(call libretro-core-setup,LIBRETRO_PCSX_REARMED))
$(eval $(generic-package))
