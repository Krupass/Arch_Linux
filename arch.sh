#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda
  g	# new GPT table
  n 	# new partition
  1 	# partition number 1
   	# default
  +1G 	# partition size
  t 	# change type
  uefi 	# EFI
  
  n 	# new partition
  2 	# partion number 2
    	# default
  +10G 	# partition size
	# default
  p 	# print the in-memory partition table
  w	# write changes
  q	# quit
EOF

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sdb
  g	# new GPT table
  n 	# new partition
  1 	# partition number 1
   	# default
   	# partition size - default
  p 	# print the in-memory partition table
  w	# write changes
  q	# quit
EOF

echo "Encrypting /dev/sda2, enter passphrase: "
read PASS
echo "YES" | cryptsetup luksFormat /dev/sda2 <<< "$PASS"
echo "Decrypting /dev/sda2, please wait..."
cryptsetup open /dev/sda2 cryptsystem <<< "$PASS"

echo "Encrypting /dev/sdb1, enter passphrase: "
read PASS
echo "YES" | cryptsetup luksFormat /dev/sdb1 <<< "$PASS"
echo "Decrypting /dev/sdb1, please wait..."
cryptsetup open /dev/sdb1 cryptbackup <<< "$PASS"

#LVM
echo "LVM"
pvcreate /dev/mapper/cryptsystem
vgcreate system /dev/mapper/cryptsystem
lvcreate -L 3G system -n var
lvcreate -L 3G system -n root
lvcreate -L 3G system -n home
lvcreate -L 500M system -n swap

#File systems
#echo "File Systems"
#mkfs.fat -F32 /dev/sda1
#mkswap /dev/system/swap
#mkfs.ext4 /dev/system/var
#mkfs.ext4 /dev/system/root
#mkfs.ext4 /dev/system/home
#mkfs.ext4 /dev/sdb1
#mount /dev/system/root /mnt
#mount --mkdir /dev/sda1 /mnt/boot
#mount --mkdir /dev/system/var /mnt/var
#mount --mkdir /dev/system/home /mnt/home
#mount --mkdir /dev/sdb1 /mnt/backup
#swapon /dev/system/swap

