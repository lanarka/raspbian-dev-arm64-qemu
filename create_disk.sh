#!/bin/bash

# Change password and grab kernel for qemu
mkdir boot
mount -o loop,offset=4194304 dev.img boot
cp boot/bcm2710-rpi-3-b-plus.dtb boot/kernel8.img .
echo 'pi:$6$6jHfJHU59JxxUfOS$k9natRNnu0AaeS/S9/IeVgSkwkYAjwJfGuYfnwsUoBxlNocOn.5yIdLRdSeHRiw8EWbbfwNSgx9/vUhu0NqF50' > boot/userconf
umount boot
rm -rf boot

# Convert image and change size
qemu-img convert -f raw -O qcow2 dev.img dev.qcow2
qemu-img resize dev.qcow2 16G

# Clean
rm -f dev.img
rm -rf boot