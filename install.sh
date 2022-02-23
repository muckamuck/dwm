#!/bin/bash

if [ ! -d "${HOME}/bin" ]; then
    mkdir ${HOME}/bin
fi

ln -sf $(pwd)/dot_xinitrc ${HOME}/.xinitrc
ln -sf $(pwd)/status.sh ${HOME}/bin/status.sh
ln -sf $(pwd)/battery.sh ${HOME}/bin/battery.sh
ln -sf $(pwd)/run_dwm.sh ${HOME}/bin/run_dwm.sh
sudo pacman -S ttf-ubuntu-font-family ttf-font-awesome picom nitrogen xorg-xsetroot
