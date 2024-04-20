#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

fdisk /dev/sda
echo "new GPT table"
echo "g"
echo "New partition"
echo "n"
echo "Partition number"
echo "1"
echo "First sector"
echo -ne '\n'
echo "Last sector"
echo "+1G"
echo "Partition type"
echo "ef00"
echo "Result"
echo "p"


