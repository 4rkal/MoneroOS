#!/bin/bash

source .simple_curses.sh

main (){
    # Basic info
    window MoneroOS "red"
    append "`date`"
    addsep
    append_tabbed "Up since|`uptime | cut -f1 -d"," | sed 's/^ *//' | cut -f3- -d" "`" 2 "|"
    endwin

    # Memory usage
    window "Memory usage" "purple"
    append_tabbed `cat /proc/meminfo | awk '/MemTotal/ {print "Total:" $2/1024}'` 2
    append_tabbed `cat /proc/meminfo | awk '/MemFree/ {print "Free:" $2/1024}'` 2
    endwin

    # Xmrig Status
    window "XMRig status" "red"
    append "`tail -f .xmrig_logs.txt`" #might not be the best implementation
    endwin


}
main_loop -t 1 "$@"
