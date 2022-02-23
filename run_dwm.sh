#!/bin/sh

${HOME}/bin/status.sh &
picom -f &
nitrogen --restore &
exec dwm
