#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

echo "Copying 52-snopf.rules to /etc/udev.rules.d"
cp 52-snopf.rules /etc/udev/rules.d
echo "Reloading rules"
udevadm control --reload-rules
udevadm trigger
echo "Done"
