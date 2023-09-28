NTFS_FILE=/run/archiso/cowspace/ntfs
if [ -f "$NTFS_FILE" ]; then
    echo "Copying data from NTFS partion"
    mount -L MoneroOS-NTFS /mnt/ntfs
    cp -r /mnt/ntfs/* /run/archiso/cowspace/
else
  if sudo blkid -o list | grep -i 'MoneroOS-NTFS'; then
    if (whiptail --title "MoneroOS Configuration Wizard" --yesno "It looks like you have a partition called MoneroOS-NTFS, would you like to copy all the data from there (do this if you have followed the windows guide)" 8 78); then
 	  mkdir -p /mnt/ntfs
	  echo "Creating MountPoint"
	  mount -L MoneroOS-NTFS /mnt/ntfs
	  echo "Copying data"
	  cp -r /mnt/ntfs/* /run/archiso/cowspace/
	  touch /run/archiso/cowspace/ntfs
	  echo "Restarting p2pool and xmrig"
	  systemctl restart p2pool xmrig 
  fi

    fi
fi
