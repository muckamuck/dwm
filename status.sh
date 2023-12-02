#!/bin/bash
export PATH=/usr/bin:${PATH}

sep=""
sep=""
sep="|"
who="$(whoami)@$(cat /proc/sys/kernel/hostname)"

touch /tmp/weather.out
while true; do
    curl -s "https://wttr.in/Ankeny?format=%C%20%t/%f" 2>/tmp/weather.err > /tmp/weather.out
    cat /tmp/weather.out
    sleep 900
done &


if [ "${LAPTOP}" == "true" ]; then
    touch /tmp/battery.out
    while true; do
        battery.sh > /tmp/battery.out
        sleep 300
    done &
fi

while true
do
    lstr=$(cat /proc/loadavg | awk '{print $1}')
    wstr=$(cat /tmp/weather.out)
    dstr=$(date '+%m/%d/%Y %H:%M')
    mstr=$(free | grep ^Mem | awk '{printf "%.1f", $3 * 100 / $2}')

    if [ "${LAPTOP}" == "true" ]; then
        bstr=$(cat /tmp/battery.out)
	    message=" ${wstr} ${sep} ${dstr} ${sep} Load: ${lstr} ${sep} Mem: ${mstr}% ${sep} ${who} ${sep} ${bstr} "
    else
	    message=" ${wstr} ${sep} ${dstr} ${sep} Load: ${lstr} ${sep} Mem: ${mstr}% ${sep} ${who} "
    fi
	xsetroot -name "${message}"
	sleep 5
done
