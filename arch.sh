#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

fdisk /dev/sda
echo "new GPT table"
g
echo "New partition"
n
echo "Partition number"
1
echo "First sector"
echo -ne '\n'
echo "Last sector"
+1G
echo "Partition type"
ef00
echo "Result"
p