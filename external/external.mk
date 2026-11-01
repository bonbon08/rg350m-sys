# libretro-core-setup,PKG: common build/install steps for libretro cores.
# A core's .mk sets <PKG>_VERSION/_SITE/_LICENSE and optionally:
#   <PKG>_SUBDIR     directory containing the makefile (default: top level)
#   <PKG>_MAKEFILE   makefile name (default: Makefile)
#   <PKG>_PLATFORM   value passed as platform= (default: unix)
#   <PKG>_MAKE_OPTS  extra make arguments
# then calls $(eval $(call libretro-core-setup,<PKG>)) and $(eval $(generic-package)).
#
# CFLAGS/LDFLAGS go through the environment so the cores' own "CFLAGS +="
# lines still apply; CC & co. go on the command line to override the
# hardcoded /opt/gcw0-toolchain paths of their gcw0 targets. LD is the C++
# driver because several cores link C++ objects through $(LD).
define libretro-core-setup
$(1)_MAKEFILE ?= Makefile
$(1)_PLATFORM ?= unix

define $(1)_BUILD_CMDS
	$$(TARGET_MAKE_ENV) \
		CFLAGS="$$(TARGET_CFLAGS)" \
		CXXFLAGS="$$(TARGET_CXXFLAGS)" \
		LDFLAGS="$$(TARGET_LDFLAGS)" \
		$$(MAKE) -C $$(@D)/$$($(1)_SUBDIR) -f $$($(1)_MAKEFILE) \
		platform=$$($(1)_PLATFORM) \
		CC="$$(TARGET_CC)" CXX="$$(TARGET_CXX)" LD="$$(TARGET_CXX)" \
		AR="$$(TARGET_AR)" RANLIB="$$(TARGET_RANLIB)" \
		$$($(1)_MAKE_OPTS)
endef

define $(1)_INSTALL_TARGET_CMDS
	mkdir -p $$(TARGET_DIR)/usr/lib/libretro
	$$(INSTALL) -m 0755 $$(@D)/$$($(1)_SUBDIR)/*_libretro.so $$(TARGET_DIR)/usr/lib/libretro/
endef
endef

# host-tar 1.34 does not build against acl >= 2.3.2 (conflicting
# acl_*_file_at declarations); ACL support is not needed for building.
HOST_TAR_CONF_OPTS += --without-posix-acls

include $(sort $(wildcard $(BR2_EXTERNAL_RG350M_SYS_PATH)/package/*/*.mk))
