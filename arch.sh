#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda
  g	# new GPT table
  n 	# new partition
  1 	# partition number 1
   	# default
  +1G 	# partition size
  t 	# change type
  1 	# EFI
  
  n 	# new partition
  2 	# partion number 2
    	# default
  +10G 	# partition size
	# default
  p 	# print the in-memory partition table
EOF


