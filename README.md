
## Requirements
* `iterm2`: https://www.iterm2.com/
* `brew`: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
* `git`: brew install git
* `tmux`: brew install tmux
* `python`: brew install python #install python3
* `neovim`: brew install neovim
* `zsh`: brew install zsh
* `oh-my-zsh`: sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
* `cmake`: brew install cmake
* `ctags`: brew install ctags
* `flake8`: pip3 install flake8
* `pylint`: pip3 install pylint

## tmux
### Installation
```bash
make install-tmux
```

### How to edit configuration
To edit tmux configuration, you need to modify `tmux/.tmux.conf.local`.
The original tmux configuration files are from https://github.com/gpakosz/.tmux.

## neovim
### Installation
```bash
make install-nvim
```
* For the initial setup, it would take a few minutes to install vim plugins.
* For the install setup, you should compile somethings for YouCompleteMe.

### Plugins
* 'SirVer/ultisnips':
* 'honza/vim-snippets'
* 'scrooloose/nerdtree': a tree explorer plugin for vim
* 'majutsushi/tagbar': a vim plugin that displays tags in a window
* 'easymotion/vim-easymotion': a motion plugin for fast navigating a file
* 'scrooloose/nerdcommenter': a plugin for easy-commenting
* 'pseewald/nerdtree-tagbar-combined'
* 'tmhedberg/matchit': extended % matching for HTML, LaTeX, and many other languages
* 'vim-scripts/indentpython.vim': python indentation
* 'Valloric/YouCompleteMe': 
* 'neomake/neomake': 
* 'nvie/vim-flake8': 
* 'kien/ctrlp.vim': 
* 'tpope/vim-fugitive': git integration
* 'vim-airline/vim-airline': 
* 'vim-airline/vim-airline-themes':

### Plugin setup
#### YouCompleteMe
After `make install-nvim`, you should compile YouCompleteMe manually. 
Move `~/.config/nvim/plugged/YouCompleteMe` and type the following:
```
python3 install.py
```


### Plugin shortcuts
#### YouCompleteMe
* Go to definition: <leader>d
* Go back: <C-o>

#### vimfiler
* Toggle safe mode: gs
* Create new file: N
* Delete file: d
* Rename file: r
* New directory: K
* Open file: e

