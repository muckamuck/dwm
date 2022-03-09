#!/bin/sh

if [ -f "$(which udiskie 2>/dev/null)" ]; then
    udiskie 2>/tmp/udiskie.log > /tmp/udiskie.log &
else
    echo "For automount USB drives install udiskie udisks2" > /tmp/udiskie.log &
fi

${HOME}/bin/status.sh &
picom -f &
nitrogen --restore &
exec dwm
