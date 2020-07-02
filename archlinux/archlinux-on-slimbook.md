# Install Archlinux on Slimbook"

2017-01-30 10:03:15 +0100

USB installation:
```bash
# dd bs=4M if=path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync
```

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
```

UEFI with GPT:

|Mount point|Partition|Partition type|Suggested size|
|-----------|---------|--------------|--------------|
|`/mnt/boot` or `/mnt/efi`|`/dev/sdX1`|EFI system partition|260–512 MiB|
|`/mnt`|`/dev/sdX2`|Linux x86-64 root (/)|	Remainder of the device|
|[SWAP]|`/dev/sdX3`|Linux swap|More than 512 MiB|

```bash
Device     Boot   Start       End   Sectors   Size Id Type
/dev/sda1          2048   1050623   1048576   512M 83 Linux
/dev/sda2       1050624 234441647 233391024 111.3G 83 Linux
```

Encrypt the disc:
```bash
# cryptsetup luksFormat /dev/sda2
# cryptsetup open /dev/sda2 cryptolvm
```

Create root and swap volumes:
```bash
# vgcreate Vol /dev/mapper/cryptolvm
# lvcreate -L 16G Vol -n swap
# lvcreate -l 100%FREE Vol -n root
```

Format the partitions:
```bash
# mkfs.ext4 /dev/mapper/Vol-root
# mkswap /dev/mapper/Vol-swap
# mkfs.vfat /dev/sda1
```

Mount the file systems:
```bash
# mount /dev/mapper/Vol-root /mnt
# swapon /dev/mapper/Vol-swap
# mkdir -p /mnt/boot/efi
# mount /dev/sda1 /mnt/boot/
```

Install the base packages:
```bash
# pacstrap /mnt base base-devel linux linux-firmware
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
# pacman -S lvm2 xfsprogs
# vim /etc/mkinitcpio.conf
HOOKS="base udev autodetect modconf block encrypt lvm2 resume filesystems keyboard fsck"
# mkinitcpio -p linux
```

```bash
# passwd
```

Microcode:
```bash
# pacman -S intel-ucode
```

Boot loader
```bash
# pacman -S grub efibootmgr
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
# vim /etc/default/grub
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda2:lvm root=/dev/mapper/Vol-root elevator=noop"
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet resume=/dev/mapper/Vol-swap"
# grub-mkconfig -o /boot/grub/grub.cfg
```

Reboot:
```bash
# exit
# umount -R /mnt
# reboot
```

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
