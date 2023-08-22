while true
do
    journalctl -u xmrig.service -b > xmrig_logs.txt
    sleep 10
done

