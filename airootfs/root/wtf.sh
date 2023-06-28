#for some reason executing this inside of the script in control.sh doesnt work. Here however it works
jq -n --arg URL "$URL" '{autosave: true, cpu: true, pools: [{url:$URL, keepalive:true}]}' > /run/archiso/cowspace/config.json
