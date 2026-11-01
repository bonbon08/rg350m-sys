################################################################################
#
# emulationstation
#
################################################################################

EMULATIONSTATION_VERSION = d9efd746a983a382d9fe031b5336317455dd0d4d
EMULATIONSTATION_SITE = https://github.com/RetroPie/EmulationStation.git
EMULATIONSTATION_SITE_METHOD = git
EMULATIONSTATION_GIT_SUBMODULES = YES
EMULATIONSTATION_LICENSE = MIT
EMULATIONSTATION_LICENSE_FILES = LICENSE.md
EMULATIONSTATION_DEPENDENCIES = sdl2 freetype libfreeimage libcurl rapidjson alsa-lib libgles

EMULATIONSTATION_CONF_OPTS = \
	-DUSE_MESA_GLES=ON \
	-DVLC=OFF \
	-DBUILD_SHARED_LIBS=OFF

# BUILD_SHARED_LIBS=OFF: link the bundled pugixml statically (buildroot's
# default ON would build it as a .so that never gets installed).


define EMULATIONSTATION_INSTALL_TARGET_CMDS
	# ES looks for resources/ next to its executable
	$(INSTALL) -D -m 0755 $(@D)/emulationstation \
		$(TARGET_DIR)/usr/share/emulationstation/emulationstation
	cp -r $(@D)/resources $(TARGET_DIR)/usr/share/emulationstation/
	ln -sf ../share/emulationstation/emulationstation $(TARGET_DIR)/usr/bin/emulationstation
endef

$(eval $(cmake-package))
