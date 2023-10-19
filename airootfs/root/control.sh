NTFS_FILE=/run/archiso/cowspace/ntfs
CONFIG_FILE=/run/archiso/cowspace/config.json
MOCFILE=/run/archiso/moc
if [ -f "$NTFS_FILE" ]; then
    echo "Copying data from NTFS partion"
    mount -L MoneroOS-NTFS /mnt/ntfs || echo "already mounted"
    rm -rf /run/archiso/cowspace/*.json
    cp -r /mnt/ntfs/* /run/archiso/cowspace/
else
  if blkid -o list | grep -i 'MoneroOS-NTFS'; then
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

# MoneroOcean
url=$(jq -r '.pools[0].url' "$CONFIG_FILE")
if [ -f "$MOCFILE" ]; then
  systemctl stop xmrig.service p2pool.service 
  rm /run/archiso/cowspace/xmrig*
  curl -s https://api.github.com/repos/MoneroOcean/xmrig/releases/latest | jq -r '.assets[] | select(.name | contains("tar.gz") and contains("compat")) | .browser_download_url' | xargs -I {} wget {} -P /run/archiso/cowspace/
  tar xvf /run/archiso/cowspace/xmrig*.tar.gz
  pacman -R --noconfirm xmrig
  cp xmrig /usr/bin/ 
  systemctl start xmrig
else
  if [[ $url == *"gulf.moneroocean.stream"* ]]; then
    systemctl stop xmrig p2pool
    echo "MoneroOcean"
    # Getting latest release
    curl -s https://api.github.com/repos/MoneroOcean/xmrig/releases/latest | jq -r '.assets[] | select(.name | contains("tar.gz") and contains("compat")) | .browser_download_url' | xargs -I {} wget {} -P /run/archiso/cowspace/
    tar xvf /run/archiso/cowspace/xmrig*.tar.gz
    pacman -R --noconfirm xmrig
    cp xmrig /usr/bin/ 
    systemctl start xmrig
    touch /run/archiso/moc
  fi
fi
