
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
```vimrc
""" jedi setting
let g:jedi#show_call_signatures_delay = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#max_doc_height = 20
let g:jedi#auto_close_doc = 1
let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"

""" deoplete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 100
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
```

#### Notes on vimtex (with neovim)
* Install https://github.com/mhinz/neovim-remote

* Add the following in your `~/.bash_profile`
```bash
export NVIM_LISTEN_ADDRESS="/tmp/nvimsocket"
```

* Go to Preference-Sync in your Skim
    - Add `nvr` (Command)
    - Add the following argument (Arguments)
> -c %line "%file"

## Articles
### vim
* https://dev.to/pmihaylov/how-can-vim-make-you-a-better-developer-2c3i
* http://rc3.org/2012/05/12/the-grammar-of-vim
* https://yanpritzker.com/learn-to-speak-vim-verbs-nouns-and-modifiers-d7bfed1f6b2d
* http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
