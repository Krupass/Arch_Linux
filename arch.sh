#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Crating sda disk"

create_partition() {
    local device="$1"
    local size="$2"
    local type="$3"

    echo -e "n\np\n\n\n+$size\n$type\nw" | fdisk "$device"
}

create_partition "/dev/sda" "1G" "ef00" # 1 GiB EFI Boot
create_partition "/dev/sda" "10G" ""     # 10 GiB Linux FS Crypt volume

