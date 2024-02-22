# CREATE DEV-MACHINE DISK IMAGE

### Download and prepare raspios image
```
	$ wget https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-04-07/2022-04-04-raspios-bullseye-arm64-lite.img.xz
	
	$ xz -d 2022-04-04-raspios-bullseye-arm64-lite.img.xz
	
	$ mv 2022-04-04-raspios-bullseye-arm64-lite.img dev.img
	
	$ ./create_disk.sh
	
```

### Resize root partition

	Start machine

```
	$ ./qemu-start.sh
```

	Resize disk	

```
	$ sudo raspi-config

 		--> Advanced (Menu 6)
 		--> Expand FS (Menu 1)
 		--> Finish & Reboot
```

### Post Installation
```
	$ sudo apt update
	$ sudo apt install ...
```


# CREATE PASSWORD
```
	echo 'mypassword' | openssl passwd -6 -stdin
```