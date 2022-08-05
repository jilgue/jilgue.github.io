# Configure SSD on Archlinux for Slimbook

2017-02-05 10:03:15 +0100

### Mount tmp dir in RAM memory:

Using the ram memory as tmp dir we avoid unnecessary writings in disc, for this we have to edit fstab:

```bash
# vim /etc/fstab
tmpfs    /tmp    tmpfs    noatime,nodiratime,nodev,nosuid,mode=1777,size=2G,defaults    0    0
tmpfs    /var/tmp    tmpfs    noatime,nodiratime,nodev,nosuid,mode=1777,size=2G,defaults    0    0
```


### Reduce the use of swap memory:
The swap partition can be used even if free memory is left. Editing sysctl we can reduce his use.

```bash
# vim /etc/sysctl.d/99-swap.conf
vm.swappiness=1
vm.vfs_cache_pressure=50
vm.dirty_writeback_centisecs=1500
```


### TRIM
Most SSDs support the ATA_TRIM command for sustained long-term performance and wear-leveling.

To verify TRIM support, run:
```bash
# lsblk -D
NAME           DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
sda                   0      512B       2G         0
├─sda1                0      512B       2G         0
└─sda2                0      512B       2G         0
  └─lvm               0      512B       2G         0
    ├─Vol-swap        0      512B       2G         0
    └─Vol-root        0      512B       2G         0
```
	
And check the values of DISC-GRAN and DISC-MAX columns. Non-zero values indicate TRIM support.

Or install hdparm package and run:
```bash
# pacman -S hdparm
# hdparm -I /dev/sda | grep TRIM
	*	Data Set Management TRIM supported (limit 1 block)
```

The fstrim command analyzes the disc, and it controls and regroups the memory blocks, making the disk management faster.
```bash
# /sbin/fstrim --all
```

fstrim can be periodic execute thanks fstrim.service and fstrim.timer systemd unit files, provided in util-linux package.

```bash
# systemctl start fstrim.timer && systemctl enable fstrim.timer
# systemctl list-timers --all
NEXT                         LEFT     LAST                         PASSED       UNIT                         ACTIVATES
Mon 2017-02-06 00:00:00 CET  11h left Mon 2017-01-30 17:53:25 CET  5 days ago   fstrim.timer                 fstrim.service
```


### Desactivate the I/O algorithm
Since they are not rotating discs, it is not necessary to calculate the algorithm. To deactivate it:
```bash
# vim /etc/default/grub 
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda2:lvm root=/dev/mapper/Vol-root elevator=noop"
# grub-mkconfig -o /boot/grub/grub.cfg
```
