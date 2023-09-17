NTFS_FILE=/run/archiso/cowspace/ntfs
if (whiptail --title "MoneroOS Configuration Wizard" --yesno "Do you want to copy configuration data from an NTFS partion? (do this if you have followed the windows installation)" 8 78); then
	whiptail --title "MoneroOS Configuration Wizard" --msgbox "This script will now try to mount any NTFS partitions and copy all the data to COWMOS"
	mkdir -p /mnt/ntfs
	echo "Creating MountPoint"
	mount -L NTFS /mnt/ntfs
	echo "Copying data"
	cp -r /mnt/ntfs/* /run/archiso/cowspace/
	touch /run/archiso/cowspace/ntfs
	echo "Restarting p2pool and xmrig"
	systemctl restart p2pool xmrig
fi
