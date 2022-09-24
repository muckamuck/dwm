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

if [ -f "${HOME}/.config/dwm/xrandr" ]; then
    . ${HOME}/.config/dwm/xrandr
    echo "XRANDR_COMMAND=${XRANDR_COMMAND}" > /tmp/xrandr_command
    ${XRANDR_COMMAND}
else
    echo "Can not find . ${HOME}/.config/dwm/xrandr"
    exit 1
fi

${HOME}/bin/status.sh &
picom -f &
nitrogen --restore &
exec dwm
