################################################################################
#
# libretro-mednafen-wswan
#
################################################################################

LIBRETRO_MEDNAFEN_WSWAN_VERSION = 4b01295838ea89e3f1355bbe4cb5cf98aa6108cd
LIBRETRO_MEDNAFEN_WSWAN_SITE = $(call github,libretro,beetle-wswan-libretro,$(LIBRETRO_MEDNAFEN_WSWAN_VERSION))
LIBRETRO_MEDNAFEN_WSWAN_LICENSE = GPL-2.0
LIBRETRO_MEDNAFEN_WSWAN_PLATFORM = gcw0

$(eval $(call libretro-core-setup,LIBRETRO_MEDNAFEN_WSWAN))
$(eval $(generic-package))
