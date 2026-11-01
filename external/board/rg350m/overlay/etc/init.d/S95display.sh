#!/bin/sh
# Pick the display output at boot (no hotplug event fires for a cable
# that is already plugged in).

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

/usr/sbin/hdmi-switch auto
rm -f /tmp/es-restart
