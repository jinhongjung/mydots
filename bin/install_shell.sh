#!/bin/sh

echo "[shell] start installing shells"
cp shell/fuz ~/bin
cp shell/tmux-session ~/bin
echo "[shell] end shell installation"

echo "[ssh] start setting up ssh config"
mkdir ~/.ssh
cp ssh/config ~/.ssh/config
echo "[ssh] end setting up ssh config"

echo "[dircolors] start installing dircolors"
if [ ! -d ~/.dircolors ]; then
    mkdir ~/.dircolors
fi

git clone https://github.com/gibbling666/dircolors.git ~/.dircolors

echo "[dircolors] end installing dircolors"
