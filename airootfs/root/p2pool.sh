#!/bin/bash
FILE=/run/archiso/cowspace/p2pool_config.json
# FILE=p2pool_example_config.json #for testing
if [ -f "$FILE" ]; then
    echo "P2Pool config found!"
    ADDRESS=`jq -r '.address' $FILE`
    HOST=`jq -r '.host' $FILE`
    RPCPORT=`jq -r '.rpcport' $FILE`
    ZMQPORT=`jq -r '.zmqport' $FILE`
    MINI=`jq -r '.mini' $FILE`
    LIGHTMODE=`jq -r '.lightmode' $FILE`
    NORANDOMX=`jq -r '.norandomx' $FILE`
    NOCACHE=`jq -r '.nocache' $FILE`
    # Possibilities:
    # Lightmode
    # Lightmode with no cache
    # No randomx
    # No randomx no cache
    # No cache
    # Everything is false
    if [ "$LIGHTMODE" = true ]; then
        if [ "$NOCACHE" = true ]; then
            echo "lightmode and no-cache"
            p2pool --host $HOST --rpc-port $RPCPORT --zmq-port $ZMQPORT --wallet $ADDRESS --light-mode --no-cache
        else #just lightmode
            echo "lightmode"
            p2pool --host $HOST --rpc-port $RPCPORT --zmq-port $ZMQPORT --wallet $ADDRESS --light-mode
        fi
    else #lightmode not true
        if [ "$NORANDOMX" = true ]; then
            if [ "$NOCACHE" = true ]; then #no cache and no randomx
                echo "no cache no randomx"
                p2pool --host $HOST --rpc-port $RPCPORT --zmq-port $ZMQPORT --wallet $ADDRESS --no-randomx --no-cache
            else #just no randomx
                echo "no randomx"
                echo p2pool --host $HOST --rpc-port $RPCPORT --zmq-port $ZMQPORT --wallet $ADDRESS --no-randomx
            fi
        fi
        if [ "$NOCACHE" = true ]; then #just no-cache
            echo "no cache"
            p2pool --host $HOST --rpc-port $RPCPORT --zmq-port $ZMQPORT --wallet $ADDRESS --no-cache
        else
            echo "normal"
            p2pool --host $HOST --rpc-port $RPCPORT --zmq-port $ZMQPORT --wallet $ADDRESS
        fi
    fi
    

else
    exit
fi