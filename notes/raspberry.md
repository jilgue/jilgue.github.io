<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Raspbian x86](#raspbian-x86)
- [Raspbian](#raspbian)
  - [Kodi](#kodi)
    - [Netflix](#netflix)
    - [Fuentes](#fuentes)
- [LibreELEC](#libreelec)
  - [Amazon](#amazon)
  - [Netflix](#netflix-1)
  - [Spotify](#spotify)
  - [Kodiadictos](#kodiadictos)
  - [Cacharrito](#cacharrito)
- [OpenELEC](#openelec)
- [Archlinux](#archlinux)
  - [LXDE](#lxde)
  - [Netflix](#netflix-2)
- [Gentoo](#gentoo)
- [Recursos](#recursos)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Raspbian x86
https://github.com/mikerr/RPi-QEMU-x86-wine
https://sourceforge.net/projects/pi-qemu-wine/files/

## Raspbian

```
# dd bs=4M if=2019-04-08-raspbian-stretch-full.img of=/dev/sdb conv=fsync
# unzip -p 2018-11-13-raspbian-stretch.zip | sudo dd of=/dev/sdX bs=4M conv=fsync
```

https://raspberryparanovatos.com/tutoriales/drm-navegador-raspberry-pi/
```
$ wget https://gist.githubusercontent.com/ruario/19a28d98d29d34ec9b184c42e5f8bf29/raw/9c35b3249ab64020c6ff990f73b3c07fc4b8662d/widevine-flash_armhf.sh
$ chmod a+x widevine-flash_armhf.sh
$ ./widevine-flash_armhf.sh
```


### Kodi

```
root@raspberrypi:~# apt-get install kodi
root@raspberrypi:~# apt-get install pulseaudio-module-bluetooth
```

bluetooth audio: https://youness.net/raspberry-pi/how-to-connect-bluetooth-headset-or-speaker-to-raspberry-pi-3
```
[B06 APTX]# power on
Changing power on succeeded
[B06 APTX]# agent on
Agent registered
[B06 APTX]# default-agent
Default agent request successful
[B06 APTX]# connect E3:28:E9:23:1E:08
```

#### Netflix
```
root@raspberrypi:~# apt-get install kodi-inputstream-adaptive
pi@raspberrypi:~ $ pip install --user pycryptodomex
```
https://github.com/CastagnaIT/plugin.video.netflix
https://github.com/castagnait/repository.castagnait/raw/master/repository.castagnait-1.0.0.zip
Install from zip
Install add-on from repository

#### Fuentes

* https://kodiadictos.com/la-fuente-de-kodiadictos/
* https://kodiadictos.com/deceit/ TV

## LibreELEC

http://releases.libreelec.tv/LibreELEC.USB-SD.Creator.Linux-64bit.bin
https://wiki.libreelec.tv/pulseaudio
https://www.firesticktricks.com/git-browser-kodi.html
https://www.addictivetips.com/media-streaming/kodi/install-netflix-on-kodi/ ??

### Amazon

https://github.com/Sandmann79/xbmc/releases
https://github.com/Sandmann79/xbmc/issues/22

### Netflix

https://github.com/kodinerds/repo/blob/master/repository.netflix/repository.netflix-1.0.1.zip
- https://github.com/peak3d/inputstream.adaptive
- https://forum.kodi.tv/showthread.php?tid=329767

!!!! testbuild https://forum.kodi.tv/showthread.php?tid=298461

`ssh root@192.168.0.159 libreelec`

### Spotify

https://github.com/kodi-community-addons/repository.marcelveldt

### Kodiadictos

https://kodiadictos.com/la-fuente-de-kodiadictos/
https://kodiadictos.com/alfa-el-mejor-addon-de-kodi/
https://kodiadictos.com/deceit/
https://kodiadictos.com/real-stream/
 + menu / ya tengo urlresolver
 + kodi / programas / extendedInfoScript
personalizar menú: https://forum.kodi.tv/showthread.php?tid=89678

### Cacharrito

https://github.com/CastagnaIT/plugin.video.netflix
https://github.com/castagnait/repository.castagnait/raw/master/repository.castagnait-1.0.0.zip
Install from zip
Install add-on from repository

Enable Input Stream Add-on Add-ons >> Package icon >> My Add-ons >> Video Player Inputstream >> Inputstream Adaptive >> menu >> enable

https://forum.kodi.tv/showthread.php?tid=331136
https://github.com/Sandmann79/xbmc/releases/download/v1.0.2/repository.sandmann79.plugins-1.0.2.zip

https://kodiadictos.com/la-fuente-de-kodiadictos/

https://kodiadictos.com/alfa-el-mejor-addon-de-kodi/

https://kodiadictos.com/deceit/

https://abc.go.com/shows/once-upon-a-time/episode-guide/season-1

https://www.wirelesshack.org/how-to-install-exodus-redux-kodi-addon.html

## OpenELEC

http://releases.openelec.tv/OpenELEC-RPi2.arm-8.0.4.img.gz

## Archlinux

https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3

### LXDE
```
# pacman -S openbox lxde gamin dbus   #Lxde and needed dependancies
# pacman -S xorg-server xorg-xinit  #Xorg
# pacman -S mesa xf86-video-fbdev xf86-video-vesa   #Video Drivers
$ echo “exec ck-launch-session startlxde” >> ~/.xinitrc
```

### Netflix

```
# pacman -S extra/chromium
$ wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pikaur
$ makepkg -si
```

widevine: https://archlinuxarm.org/forum/viewtopic.php?f=60&t=13189&p=60437&hilit=widevine#

## Gentoo

https://wiki.gentoo.org/wiki/Raspberry_Pi_3_64_bit_Install

## Recursos

* https://www.makeuseof.com/tag/netflix-amazon-video-plex-raspberry-pi/
* https://raspberryparanovatos.com/tutoriales/drm-navegador-raspberry-pi/
* https://developers.whatismybrowser.com/useragents/explore/operating_system_name/chromeos/
