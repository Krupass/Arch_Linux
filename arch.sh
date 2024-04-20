#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

fdisk /dev/sda
echo g
echo n
echo 1
echo 
echo +1G
echo ef00

echo n
echo 2
echo 
echo +10G
echo 
echo p



