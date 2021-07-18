#!/bin/bash
intern=DSI-1
extern=HDMI-1

echo "checking for HDMI monitor...";
if xrandr | grep "$extern connected"; then
	echo "HDMI monitor found...";

	if cat /boot/config.txt | grep "ignore_lcd=0"; then
		echo "disabling LCD monitor...";
		sudo sed -i "s/ignore_lcd=0/ignore_lcd=1/" /boot/config.txt;

		if cat /boot/config.txt | grep "ignore_lcd=1"; then
			echo "restarting system...";
			sudo reboot now;
		fi

	else
		echo "enabling LCD monitor for next boot...";
		sudo sed -i "s/ignore_lcd=1/ignore_lcd=0/" /boot/config.txt;
	fi
fi
