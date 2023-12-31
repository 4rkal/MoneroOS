NTFS_FILE=/run/archiso/cowspace/ntfs
if (whiptail --title "MoneroOS Configuration Wizard" --yesno "Do you want to copy configuration data from an NTFS partion? (do this if you have followed the windows installation)" 8 78); then
	mkdir -p /mnt/ntfs
	echo "Creating MountPoint"
	mount -L MoneroOS-NTFS /mnt/ntfs
	echo "Copying data"
	cp -r /mnt/ntfs/* /run/archiso/cowspace/
	touch /run/archiso/cowspace/ntfs
	echo "Restarting p2pool and xmrig"
	systemctl restart p2pool xmrig
fi
