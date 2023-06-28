FILE=/run/archiso/cowspace/config_done
P2POOL_FILE=/run/archiso/cowspace/p2pool_ip
export URL=`cat /run/archiso/cowspace/p2pool_ip`
XMRIGCC=/run/archiso/cowspace/xmrigCC_done

if [ -f "$FILE" ]; then
    echo "Configuration already done!"
    if [ -f "$P2POOL_FILE" ]; then
        mv /run/archiso/cowspace/config.json /run/archiso/cowspace/configold.json || echo
        ./wtf.sh
        systemctl restart xmrig.service
    else
        if [ -f "$XMRIGCC" ]; then
            echo xmrigCC started
            systemctl start xmrigCC.service
        else
            echo "No valid configurations found"
        fi
    fi
else
    ./setup.sh
fi