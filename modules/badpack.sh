#!/bin/bash
readarray -t badpcks < ./db/badpackages.txt # Put each line of the file into badpcks
for pck in "${badpcks[@]}"; do
    printf "Looking for %-30s" "$pck" 
    on_sys=$(dpkg -l | grep -ic "^ii.*$pck")
    if [ "$on_sys" -gt 0 ]; then
        printf " Found\nWould you like to remove $pck [Y/N]\n> "
        echo -n "Found package $pck" >> ./log/packlog
        read conf1
        case "$conf1" in
            [Yy]* ) sudo apt purge -y "$pck"; echo ": REMOVED" >> ./log/packlog ;;
            [Nn]* ) echo ": KEPT" >> ./log/packlog;;
            * ) echo "Please enter Y or N."; exit 1;;
        esac
    else
        printf " Not found\n"
    fi
done
