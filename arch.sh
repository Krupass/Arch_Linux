#!/usr/bin/env bash

echo "This is the best Arch Linux installation script, behold my ultimate power!!!"

echo "Creating sda disk"

DEVICE="/dev/sda"
PARTITION_SIZE="1G"
PARTITION_TYPE="ef00"

fdisk "$DEVICE" <<EOF
n    # Vytvoření nového oddílu
p    # Primární oddíl
      # Defaultní číslo oddílu (1)
      # Defaultní počáteční sektor
+$PARTITION_SIZE    # Velikost oddílu
$PARTITION_TYPE    # Typ oddílu (EFI)
w    # Uložit změny
EOF


