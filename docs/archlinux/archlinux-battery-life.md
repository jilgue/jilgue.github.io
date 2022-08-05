# Maximise battery life on Archlinux

2017-02-06 18:03:15 +0100

## Acpid:

acpid2 is a flexible and extensible daemon for delivering ACPI events.

```bash
# pacman -S acpid
# systemctl enable acpid.service 
# systemctl start acpid.service 
```

## TLP:

TLP brings you the benefits of advanced power management for Linux without the need to understand every technical detail.

```bash
# pacman -S tlp
# pacman -S ethtool smartmontools x86_energy_perf_policy
# systemctl enable tlp.service tlp-sleep.service
```

## Microcode:

```bash
# pacman -S intel-ucode 
# grub-mkconfig -o /boot/grub/grub.cfg
```

## Linux monitoring sensors and CPU frequency scaling

```bash
# pacman -S lm_sensors 
# yaourt -S thermald
# systemctl start thermald.service 
# systemctl enable thermald.service
```


## Powertop

If you don't have enoght with all this, use the powertop optimizer
```bash
# pacman -S powertop
# powertop
```
