#!/bin/bash

printf "Changing passwords..."

echo "root:root" | chpasswd
echo "chronos:chronos" | chpasswd
echo "chronos:chronos" > /mnt/stateful_partition/etc/devmode.passwd

echo "Done"
