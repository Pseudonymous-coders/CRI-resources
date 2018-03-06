#!/bin/bash

DEFAULT_PASS="test0000"
SUDOERS_FILE=/etc/sudoers
SUDOERS_NOPASSWD="chronos ALL=(ALL) NOPASSWD:ALL"

echo "The default password for the chromebook's devmode is $DEFAULT_PASSWORD"
printf "Changing passwords..."

echo "root:root" | chpasswd
echo "chronos:chronos" | chpasswd
echo "chronos:chronos" > /mnt/stateful_partition/etc/devmode.passwd

printf "Done\nFixing sudo permissions..." 

sudo chmod 775 $SUDOERS_FILE

if sudo grep -q "$SUDOERS_NOPASSWD" $SUDOERS_FILE; then
  # Found the nopasswd in the sudoers file
  echo "Skipping"
else
  # Couldn't find the nopasswd in the sudoers file
  sudo echo "$SUDOERS_NOPASSWD" >> $SUDOERS_FILE
  echo "Done"
fi

echo "Finished fixing the chromebook super user settings..."
