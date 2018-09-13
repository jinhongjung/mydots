#!/bin/sh

echo "[shell] start installing shells"
cp shel/fuz ~/bin
cp shel/tmux-session ~/bin
echo "[shell] end shell installation"

echo "[ssh] start setting up ssh config"
cp ssh/config ~/.ssh
echo "[ssh] end setting up ssh config"
