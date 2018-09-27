#!/bin/sh

echo "[shell] start installing shells"
cp shel/fuz ~/bin
cp shel/tmux-session ~/bin
echo "[shell] end shell installation"

echo "[ssh] start setting up ssh config"
cp ssh/config ~/.ssh
echo "[ssh] end setting up ssh config"

echo "[dircolors] start installing dircolors"
if [ ! -d ~/.dircolors ]; then
    mkdir ~/.dircolors
fi

git clone https://github.com/gibbling666/dircolors.git ~/.dircolors

echo "[dircolors] end installing dircolors"
