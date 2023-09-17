NTFS_FILE=/run/archiso/cowspace/ntfs
if [ -f "$NTFS_FILE" ]; then
    echo "Copying data from NTFS partion"
    mount -L NTFS /mnt/ntfs
    cp -r /mnt/ntfs/* /run/archiso/cowspace/
fi
