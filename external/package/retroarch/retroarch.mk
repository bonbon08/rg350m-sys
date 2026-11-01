################################################################################
#
# retroarch
#
################################################################################

RETROARCH_VERSION = v1.22.2
RETROARCH_SITE = $(call github,libretro,RetroArch,$(RETROARCH_VERSION))
RETROARCH_LICENSE = GPL-3.0+
RETROARCH_LICENSE_FILES = COPYING
RETROARCH_DEPENDENCIES = sdl alsa-lib eudev zlib openssl libshake

# Our GCC is built without LTO support.
define RETROARCH_DISABLE_LTO
	$(SED) 's/ -flto//' $(@D)/Makefile.rg350_odbeta
endef
RETROARCH_POST_PATCH_HOOKS += RETROARCH_DISABLE_LTO

RETROARCH_MAKE_OPTS = \
	-f Makefile.rg350_odbeta \
	GCW0_CC="$(TARGET_CC)" \
	GCW0_CXX="$(TARGET_CXX)" \
	GCW0_STRIP="$(TARGET_STRIP)" \
	GCW0_SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
	GCW0_FREETYPE_CONFIG=/bin/true \
	GCW0_INC_DIR="$(STAGING_DIR)/usr/include" \
	GCW0_LIB_DIR="$(STAGING_DIR)/usr/lib"

define RETROARCH_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(RETROARCH_MAKE_OPTS) retroarch
endef

define RETROARCH_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/retroarch $(TARGET_DIR)/usr/bin/retroarch
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
endef

$(eval $(generic-package))
