#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

DEVICE="/dev/sda"
PARTITION_SIZE="1G"
PARTITION_TYPE="ef00"

fdisk "$DEVICE" <<EOF
g
n   
p    
      
      
+$PARTITION_SIZE
$PARTITION_TYPE
w
EOF


