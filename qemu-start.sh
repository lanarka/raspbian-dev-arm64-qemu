#!/bin/bash

qemu-system-aarch64 \
    -m 1024 \
    -M raspi3b \
    -kernel kernel8.img \
    -dtb bcm2710-rpi-3-b-plus.dtb \
    -sd dev.qcow2 \
    -append "console=ttyAMA0 root=/dev/mmcblk0p2 rw rootwait rootfstype=ext4" \
    -nographic \
    -device usb-net,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::5555-:22
