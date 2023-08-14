#!/bin/bash
profile=$(whiptail --title "Welcome to MoneroOS configuration wizard" --menu "Choose a mining profile" 20 60 10\
    "1." "Mine to a centralized pool (nanopool,moneroocean etc)" \
    "2." "Mine to your existing p2pool node (pinodexmr or custom)" \
    "3." "Mine with XmrigCC" \
    "4." "I have already configured config.json to my needs" \
    "5." "I want to edit my config.json file" 3>&2 2>&1 1>&3
)
case $profile in
    # centralized
    # TODO make xmrig wizard like bash script and run it
    "1.")
        TERM=ansi whiptail --title "Xmrig wizard" --msgbox "Please head to https://xmrig.com/wizard (on another computer)\n Create a config by following the steps then save that config onto your usb drive\n More information at https://github.com/4rkal/moneroOS#installation-and-configuration" 10 90
    ;;
    # existing p2pool
    "2.")
        p2pool_ip=$(whiptail --title "Existing p2pool node" 3>&1 1>&2 2>&3 --inputbox "If you have a p2pool node up and running or just have pinodexmr with p2pool enabled or have gupax up and running on another computer you can just enter your nodes ip below (including the port eg 192.168.1.69:3333):" 20 60 10)
        exitstatus=$?
        if [ $exitstatus = 0 ]; then
            echo $p2pool_ip >> /run/archiso/cowspace/p2pool_ip
            touch /run/archiso/cowspace/config_done
        else
            echo "cancled by user"
        fi

    ;;
    # xmrigcc
    "3.")
        TERM=ansi whiptail --title "XmrigCC" --msgbox "You will have to be running the xmrigCC server on another computer \n Once you have xmrigCC server running on another computer press ok \n Read more https://github.com/Bendr0id/xmrigCC" 10 90
        TERM=ansi whiptail --title "XmrigCC" --msgbox "This installer will now go ahead and download the latest version of xmrig to persistent storage \n Press ok to continue" 10 90
        mkdir /run/archiso/cowspace/xmrigCC
        wget -P /run/archiso/cowspace/xmrigCC/ https://github.com/Bendr0id/xmrigCC/releases/download/3.3.3/xmrigCC-miner_only-3.3.3-linux-generic-static-amd64.tar.gz
        TERM=ansi whiptail --title "XmrigCC" --msgbox "Will now open the miner config.json from persistent storage \n Press ok to continue" 10 90
        tar xvf /run/archiso/cowspace/xmrigCC/xmrigCC*.tar.gz -C /run/archiso/cowspace/xmrigCC/
        nano /run/archiso/cowspace/xmrigCC/config.json
        TERM=ansi whiptail --title "XmrigCC" --msgbox "Config done. Starting miner" 10 90
        touch /run/archiso/cowspace/config_done
        touch /run/archiso/cowspace/xmrigCC_done
        /run/archiso/cowspace/xmrigCC/xmrigDaemon
    ;;
    "4.")
        echo "Ok sounds good!"
        echo "Starting xmrig"
        systemctl start xmrig.service
        touch /run/archiso/cowspace/config_done
    ;;
    "5.")
        nano /run/archiso/cowspace/config.json
        touch /run/archiso/cowspace/config_done
esac
exit