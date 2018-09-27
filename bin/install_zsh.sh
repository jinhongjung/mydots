#!/bin/bash

ZSH_CUSTOM=~/.oh-my-zsh/custom
#####################################
# ZSH setting
#####################################

echo "[zsh] start setting zsh configuration"

echo "[zsh] install spaceship theme"
if [ ! -f "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" ]; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

echo "[zsh] install zsh-syntax-highlighting plugin"
if [ ! -f "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

echo "[zsh] install zsh-autosuggestions plugin"
if [ ! -f "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo "[zsh] install files for zsh configuration"
cp zsh/.zshrc ~/.zshrc
source ~/.zshrc

echo "[zsh] end zsh configuration"
