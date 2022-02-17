#!/bin/bash

if [ ! -d "${HOME}/bin" ]; then
    mkdir ${HOME}/bin
fi

ln -s $(pwd)/dot_xinitrc ${HOME}/.xinitrc
ln -s $(pwd)/status.sh ${HOME}/bin/status.sh
sudo pacman -S ttf-ubuntu-font-family ttf-font-awesome
