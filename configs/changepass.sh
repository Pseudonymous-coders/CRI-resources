#!/bin/bash

SUDOERS_FILE=/usr/sudoers
SUDOERS_NOPASSWD="chronos ALL=(ALL) NOPASSWD:ALL"

printf "Changing passwords..."

echo "root:root" | chpasswd
echo "chronos:chronos" | chpasswd
echo "chronos:chronos" > /mnt/stateful_partition/etc/devmode.passwd

printf "Done\nFixing sudo permissions..." 

sudo chmod 777 $SUDOERS_FILE

if grep -q "$SUDOERS_NOPASSWD" $SUDOERS_FILE; then
  # Found the nopasswd in the sudoers file
  echo "Skipping"
else
  # Couldn't find the nopasswd in the sudoers file
  echo "$SUDOERS_NOPASSWD" > $SUDOERS_FILE
fi


echo "Done"
