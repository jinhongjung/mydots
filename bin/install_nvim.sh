#!/bin/bash

mkdir ~/.config/nvim

#####################################
# NEOVIM setting
#####################################

echo "[neovim] start setting neovim configuration"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

if [ -d ~/.config/nvim ]; then
    echo "[neovim] remove existing ~/.config/nvim"
    #rm -rf ~/.config/nvim
else
    mkdir ~/.config/nvim
fi

#cp -r .vim/* ~/.config/nvim/
#cp -r .vim/init.vim ~/.config/nvim/init.vim
#cp -r .vim/airline/afterglow.vim ~/.vim/bundle/vim-airline/autoload/airline/themes
#cp .vim/.ycm_extra_conf.py ~/.config/nvim

cp -r nvim ~/.config
echo "[neovim] start installing neovim plugins"
nvim +PlugInstall +qall
echo "[neovim] end neovim configuration"

cp nvim/airline/afterglow.vim ~/.config/nvim/plugged/vim-airline/autoload/airline/themes


#echo "install syntax for matlab"
#cp .vim/syntax/matlab.vim ~/.vim/syntax/
#echo "install indent for matlab"
#cp .vim/indent/matlab.vim ~/.vim/indent/
#echo "set nvim configuration"
#cp -r .vim/* ~/.config/nvim
#cp -r .vim/init.vim ~/.config/nvim/init.vim
#cp -r .vim/airline/afterglow.vim ~/.vim/bundle/vim-airline/autoload/airline/themes
#cp -r .vim/.ycm_extra_conf.py ~/.config/nvim
