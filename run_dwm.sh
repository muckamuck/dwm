#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f "$(which udiskie 2>/dev/null)" ]; then
    udiskie 2>/tmp/udiskie.log > /tmp/udiskie.log &
else
    echo "For automount USB drives install udiskie udisks2" > /tmp/udiskie.log &
fi

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
xrandr --output "DP-0" --mode 2560x1080 --output "DP-2" --mode 1920x1080 --above "DP-0"
${HOME}/bin/status.sh &
picom -f &
nitrogen --restore &
exec dwm
