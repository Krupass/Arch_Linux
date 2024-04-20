#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda
  g
  n # new partition
  1 # partition number 1
    # default - start at beginning of disk 
  +1G # 1 GB boot parttion
  
  n # new partition
  2 # partion number 2
    # default, start immediately after preceding partition
  +10G #

  p # print the in-memory partition table
EOF


