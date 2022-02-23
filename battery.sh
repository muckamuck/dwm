#!/bin/bash

full=""
three_quarter=""
half=""
one_quarter=""

# upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
upower -i $(upower -e | grep BAT) > /tmp/battery.log
p=$(
    grep percentage /tmp/battery.log | \
        sed 's/ //g' | \
        sed 's/%//g' | \
        awk -F':' '{print $2}'
)

if [ "${p}" -lt 36 ]; then
    echo -n "${one_quarter}  ${p}%"
elif [ "${p}" -lt 50 ]; then
    echo -n "${half}  ${p}%"
elif [ "${p}" -lt 90 ]; then
    echo -n "${three_quarter}  ${p}%"
else
    echo -n "${full}  ${p}%"
fi
