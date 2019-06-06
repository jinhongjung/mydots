
## Requirements
* `iterm2`: https://www.iterm2.com/
* `brew`: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
* `git`: brew install git
* `tmux`: brew install tmux
* `python`: brew install ~~python #install python3~~
    - install python 3.6.6 from https://www.python.org/downloads/release/python-366/
* `neovim`: brew install neovim
* `zsh`: brew install zsh
* `oh-my-zsh`: sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
* `cmake`: brew install cmake
* `ctags`: brew install ctags
* `coreutils': brew install coreutils
    - dircolors
* `flake8`: pip3 install flake8
* `pylint`: pip3 install pylint
* `jedi`: pip3 install jedi
* `neovim-remote`: pip3 install neovim-remote
* `tmuxinator`: gem install tmuxinator
* `glances`: brew install glances

## tmux
### Installation
```bash
make install-tmux
```

### How to edit configuration
To edit tmux configuration, you need to modify `tmux/.tmux.conf.local`.
The original tmux configuration files are from https://github.com/gpakosz/.tmux.

## font
### Installation
```bash
make install-font
```
* This will install powerline fonts on your system.
* https://github.com/powerline/fonts
* http://nerdfonts.com/
    - Currently, I am using FiraCode in my terminal.

## zsh
### Installation
```bash
make install-zsh
```

### zsh setup
* theme: spaceship
* vi-mode
* zsh-syntax-highlighting
* zsh-autosuggestions
* colorls - https://github.com/athityakumar/colorls


## neovim
### Installation
```bash
make install-nvim
```
* For the initial setup, it would take a few minutes to install vim plugins.

### Installed Plugins
* See nvim/init.vim

### Plugin setup
#### Autocompletion for python
* The below setting provides a satisfactory performance for autocompletion in python.
* Tested environment: macos, python 3.6.6
* Used plugins
    - Plug 'davidhalter/jedi-vim' " A plugin for autocompletion of python
    - Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    - Plug 'zchee/deoplete-jedi'
        - Plugins for supporting asynchronous autocompletion of python
* pip3 install jedi
* set up jedi-vim as shown in nvim/init.vim

#### Notes on vimtex (with neovim)
* Install skim
    - https://skim-app.sourceforge.io/
* Install neovim-remote
    - https://github.com/mhinz/neovim-remote
    - pip3 install neovim-remote
* Go to Preference-Sync in your Skim
    - Add `nvr` (Command)
    - Add the following argument (Arguments)
> -c %line "%file"


## Karabiner
* https://pqrs.org/osx/karabiner/
* `caps_lock` -> `left_control` (Simple Modification)
* Vi mode : left_control + hjkl (Complex Modification)

## Articles
### Development Setting
* https://subicura.com/2017/11/22/mac-os-development-environment-setup.html

### vim
* https://dev.to/pmihaylov/how-can-vim-make-you-a-better-developer-2c3i
* http://rc3.org/2012/05/12/the-grammar-of-vim
* https://yanpritzker.com/learn-to-speak-vim-verbs-nouns-and-modifiers-d7bfed1f6b2d
* http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
* https://www.techrepublic.com/blog/linux-and-open-source/using-vi-key-bindings-in-bash-and-zsh/

### zsh
* https://medium.com/@caulfieldOwen/youre-missing-out-on-a-better-mac-terminal-experience-d73647abf6d7
