#!/bin/bash
scan(){
randem1=$(cat /dev/urandom | tr -dc 'A-ZA-Z0-4' | fold -w 2 | head -n 1)
randem=$(cat /dev/urandom | tr -dc 'A-ZA-Z0-4' | fold -w 4 | head -n 1)
printf "${GREEN}[SUKSES] BLMOIQ$randem\n";
        echo "BLMOIQ$randem" >> list.txt
        printf "${NORMAL}"
}
read -p "Limit: " limit;
    if [[ $perSec == '' ]]; then
    read -p "Delay time: " perSecs
    duration=$SECONDS
    echo "[$header] ========= $perSec Please. $(($duration / 3600)) Wait $(($duration / 60)) ========= $(($duration % 60)) "
    sleep $perSec
fi
    for (( i = 0; i < $limit; i++ )); do
    scan $randem
done

