
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
make install-vim
```
* For the initial setup, it would take a couple of minutes to install vim plugins.
* For the install setup, you should compile somethings for YouCompleteMe.

### Plugins
* YouCompleteMe


### Plugin setup
#### YouCompleteMe
After `make install-vim`, you should compile YouCompleteMe manually. 
Move `~/.config/nvim/plugged/YouCompleteMe` and type the following:
```
python3 install.py
```
