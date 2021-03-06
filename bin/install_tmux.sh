#!/bin/bash

#####################################
# TMUX setting
#####################################

echo "[tmux] start setting tmux configuration"
echo "[tmux] install files for tmux configuration"

if [ -d ~/.tmux ]; then
	echo "[tmux] remove existing ~/.tmux"
    rm -rf ~/.tmux
fi

if [ -L ~/.tmux.conf ]; then
    echo "[tmux] remove existing ~/.tmux.conf"
    rm -rf ~/.tmux.conf
fi

if [ -f ~/.tmux.conf.local ]; then
    echo "[tmux] remove existing ~/.tmux.conf.local"
    rm -rf ~/.tmux.conf.local
fi

cp -r tmux ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/.tmux.conf.local

if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

cp tmux/tmuxinator.zsh ~/bin
cp -r tmux/tmuxinator ~/.config

echo "[tmux] end tmux configuration"
