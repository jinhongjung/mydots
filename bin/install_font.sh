#!/bin/bash

#####################################
# Install Powerline Fonts
#####################################
# https://github.com/powerline/fonts

echo "[font] start installing powerline fonts"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo "[font] end installing powerline fonts"
