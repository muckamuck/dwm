#!/bin/bash

who="$(whoami)@$(cat /proc/sys/kernel/hostname)"

touch /tmp/weather.out
while true; do
    # curl -s "https://wttr.in/Ankeny?format=%c%20%t" 2>/tmp/weather.err > /tmp/weather.out
    #curl -s "https://wttr.in/Ankeny?format=%C%20%t%20/%20%f" 2>/tmp/weather.err > /tmp/weather.out
    curl -s "https://wttr.in/Ankeny?format=%C%20%t/%f" 2>/tmp/weather.err > /tmp/weather.out
    sleep 900
done &

while true
do
    lstr=$(cat /proc/loadavg | awk '{print $1}')
    wstr=$(cat /tmp/weather.out)
	dstr=$(date '+%m/%d/%Y %H:%M')
	message=" ${wstr} | ${dstr} | Load: ${lstr} | ${who} "
	xsetroot -name "${message}"
	sleep 5
done
