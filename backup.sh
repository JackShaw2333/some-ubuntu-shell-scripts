#!/bin/bash

#--------------------
# This is a script for backing up a Ubuntu system into a "tar.gz" file.
# 1. clean something unnessary
# 2. back up "/"
# 3. back up "/home"
# 4. back up "/boot"
#--------------------

# clean old softwares' cache
inst="sudo apt autoclean"
printf "[$0] $inst\n"
apt autoclean

# clean all the softwares' cache
inst="sudo apt clean"
printf "[$0] $inst\n"
apt clean

# remove isolated softwares that this system no longer uses
inst="sudo apt autoremove"
printf "[$0] $inst\n"
apt autoremove

# back up "/"
backup_directory="/media/jared/backup"
root_backup="ubuntu_backup@`date +%Y-%m-%d`.tar.gz"

printf "[$0] backup directory will be $backup_directory. (y/n): "

yon=""
read yon

if [[ $yon = "n" || $yon = "N" ]]
then
    printf "[$0] type in the target directory: "
    read backup_directory
fi

printf "[$0] $root_backup is to be stored in $backup_directory.\n"
printf "[$0] directories \"/proc /tmp /lost+found /media /mnt /run /home /boot\" will be ignored.\n"

inst="sudo tar -cvpzf $backup_directory/$root_backup --exclude=/proc --exclude=/tmp --exclude=/lost+found --exclude=/media --exclude=/mnt --exclude=/run --exclude=/home --exclude=/boot /"
printf "[$0] $inst\n"
tar -cvpzf $backup_directory/$root_backup --exclude=/proc --exclude=/tmp --exclude=/lost+found --exclude=/media --exclude=/mnt --exclude=/run --exclude=/home --exclude=/boot /

# back up "/home"
home_backup="ubuntu_home_backup@`date +%Y-%m-%d`.tar.gz"
printf "[$0] $home_backup is to be stored in $backup_directory.\n"
inst="sudo tar -cvpzf $backup_directory/$home_backup /home"
tar -cvpzf $backup_directory/$home_backup /home

# back up "/boot"
boot_backup="ubuntu_boot_backup@`date +%Y-%m-%d`.tar.gz"
printf "[$0] $boot_backup is to be stored in $backup_directory.\n"
inst="sudo tar -cvpzf $backup_directory/$boot_backup /home"
tar -cvpzf $backup_directory/$boot_backup /boot

# Done!
printf "[$0] Done.\n"