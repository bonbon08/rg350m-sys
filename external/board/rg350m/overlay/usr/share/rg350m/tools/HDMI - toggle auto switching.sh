#!/bin/sh
# Turn automatic switching to HDMI on or off (e.g. to charge from a TV port
# without losing the internal screen).
FLAG=/usr/local/etc/hdmi-disabled
if [ -e $FLAG ]; then
	rm -f $FLAG
else
	touch $FLAG
fi
sudo /usr/sbin/hdmi-switch auto
