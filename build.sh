#!/bin/sh
# Build RG350M-SYS.
#
#   ./build.sh            configure (if needed) and build everything
#   ./build.sh config     only (re)generate the configuration
#   ./build.sh clean      wipe the output directory and rebuild from scratch
#   ./build.sh <target>   pass a target to buildroot (e.g. emulationstation-rebuild)
set -e

TOP=$(cd "$(dirname "$0")" && pwd)
BR="$TOP/buildroot"
O="$TOP/output"
EXT="$BR/board/opendingux:$TOP/external"

# Variables from the host environment that confuse buildroot.
unset PERL_MM_OPT CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM \
	CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE LD_LIBRARY_PATH

# Host GCC >= 15 defaults to C23 (and >= 16 to C++20), too new for
# buildroot 2023.11's host tools.
if [ "$(gcc -dumpversion | cut -d. -f1)" -ge 15 ]; then
	export HOSTCC="$TOP/external/host-wrappers/gcc"
	export HOSTCXX="$TOP/external/host-wrappers/g++"
fi

# CMake >= 4 rejects cmake_minimum_required() below 3.5, which many of the
# pinned package versions still declare.
export CMAKE_POLICY_VERSION_MINIMUM=3.5

if [ "$1" = clean ]; then
	echo "Removing $O ..."
	rm -rf "$O"
	shift
fi

configure() {
	mkdir -p "$O"
	cat "$BR/configs/od_gcw0_defconfig" \
		"$TOP/external/configs/rg350m_sys.fragment" > "$O/rg350m_sys_defconfig"
	make -C "$BR" O="$O" BR2_EXTERNAL="$EXT" \
		BR2_DEFCONFIG="$O/rg350m_sys_defconfig" defconfig
}

# Reconfigure whenever one of the config inputs is newer than .config.
if [ ! -f "$O/.config" ] || [ "$1" = config ] ||
   [ "$TOP/external/configs/rg350m_sys.fragment" -nt "$O/.config" ] ||
   [ "$BR/configs/od_gcw0_defconfig" -nt "$O/.config" ]; then
	configure
fi

[ "$1" = config ] && exit 0

nice make -C "$BR" O="$O" "$@"

if [ $# -eq 0 ]; then
	echo
	echo "SD card image: $O/images/rg350m-sys.img"
fi
