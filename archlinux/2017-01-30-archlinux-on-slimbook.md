# Install Archlinux on Slimbook"

2017-01-30 10:03:15 +0100

First steps:
```bash
# loadkeys es
# systemctl start sshd
# passwd
# timedatectl set-ntp true
```

Partition the disks:
Create one partition boot and and another for the rest.
```bash
# fdisk /dev/sda

Disposit.  Inicio Comienzo     Final  Sectores Tamaño Id Tipo
/dev/sda1             2048    821247    819200   400M 83 Linux
/dev/sda2           821248 234441647 233620400 111,4G 83 Linux

```

Encrypt the disc:
```bash
# cryptsetup luksFormat /dev/sda2
# cryptsetup open /dev/sda2 cryptolvm
```

Create root and swap volumes:
```bash
# vgcreate Vol /dev/mapper/cryptolvm
# lvcreate -L 8G Vol -n swap
# lvcreate -l 100%FREE Vol -n root
```

Format the partitions:
```bash
# mkfs.ext4 /dev/mapper/Vol-root
# mkswap /dev/mapper/Vol-swap
# mkfs.ext2 /dev/sda1
```

Mount the file systems:
```bash
# mount /dev/mapper/Vol-root /mnt
# swapon /dev/mapper/Vol-swap
# mkdir /mnt/boot
# mount /dev/sda1 /mnt/boot
```

Install the base packages:
```bash
# pacstrap /mnt base base-devel
```

Generate fstab:
```bash
# genfstab -U /mnt >> /mnt/etc/fstab
```

Change root into the new system:
```bash
# arch-chroot /mnt
```

Configurate time zone:
```bash
# ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime
# ls -l /etc/localtime
# rm /etc/localtime
# ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime
# hwclock --systohc
```

```bash
# pacman -S vim
```

Configurate locale:
```bash
# vim /etc/locale.gen
# locale-gen
# vim /etc/locale.conf
LANG=es_ES.utf8
# vim /etc/vconsole.conf
KEYMAP=es
```

Configurate hostname:
```bash
# vim /etc/hostname
slimbook
```

Initramfs:
```bash
# vim /etc/mkinitcpio.conf
HOOKS="base udev autodetect modconf block encrypt lvm2 resume filesystems keyboard fsck"
# mkinitcpio -p linux
```

```bash
# passwd
```

Boot loader
```bash
# pacman -S grub
# grub-install --target=i386-pc /dev/sda
# vim /etc/default/grub
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda2:lvm root=/dev/mapper/Vol-root elevator=noop"
GRUB_CMDLINE_LINUX_DEFAULT="quiet resume=/dev/mapper/Vol-swap"
# grub-mkconfig -o /boot/grub/grub.cfg
```

_reboot_

Add user:
```bash
# useradd -m -g users -G wheel -s /bin/bash cesar
```

Install graphical user interface:
```bash
# pacman -S xf86-video-intel
# pacman -S xorg
# pacman -S plasma
# pacman -S bash-completion
```

Note: ifconfig is deprecated, use _ip addr_: https://www.archlinux.org/news/deprecation-of-net-tools/
