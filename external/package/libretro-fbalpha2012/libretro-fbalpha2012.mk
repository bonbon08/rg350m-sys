################################################################################
#
# libretro-fbalpha2012
#
################################################################################

LIBRETRO_FBALPHA2012_VERSION = 0ce31536bef3162fe7e69ff5f555334ec4913cef
LIBRETRO_FBALPHA2012_SITE = $(call github,libretro,fbalpha2012,$(LIBRETRO_FBALPHA2012_VERSION))
LIBRETRO_FBALPHA2012_LICENSE = FBA (non-commercial)
LIBRETRO_FBALPHA2012_MAKEFILE = makefile.libretro
LIBRETRO_FBALPHA2012_SUBDIR = svn-current/trunk
LIBRETRO_FBALPHA2012_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_FBALPHA2012))
$(eval $(generic-package))
