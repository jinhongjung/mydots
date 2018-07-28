""""""""""""""""""""""""""""
"""" Basic setup
""""""""""""""""""""""""""""
"source ~/.vim/bundles.vim
"source ~/.config/nvim/bundles.vim
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'    " a tree explorer plugin for vim
Plug 'majutsushi/tagbar'  " a vim plugin that displays tags in a window
Plug 'easymotion/vim-easymotion'  " a motion plugin for fast navigating a file
Plug 'scrooloose/nerdcommenter'   " a plugin for easy-commenting
Plug 'pseewald/nerdtree-tagbar-combined'
Plug 'tmhedberg/matchit'  " extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/indentpython.vim'   " python indentation
Plug 'Valloric/YouCompleteMe'
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive' " git integration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


""" encoding detection setting
set fileencodings=utf-8
set encoding=utf-8

""" color setting
color afterglow
set t_Co=256

""" editor setting
set backspace=indent,eol,start
set number
set relativenumber

"" for vim slow issues
set nocompatible
set ttyfast
set lazyredraw
set synmaxcol=128
syntax sync minlines=256

"" display 80 characters line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80

"" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"" unset the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

""" indentation setting
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set autoindent
set smartindent                                     " indent when
set smarttab
set expandtab

"" for python indentation
au BufNewFile,BufRead *.py : 
		\ set tabstop=4 | 
		\ set softtabstop=4 |
		\ set shiftwidth=4 | 
		\ set textwidth=79 |
		\ set expandtab | 
		\ set autoindent | 
		\ set fileformat=unix | 


""" clipboard setting
set clipboard=unnamedplus

""" vim spell-checker setting
" set spell spelllang=en_us

""""""""""""""""""""""""""""
"""" Plugin setup 
""""""""""""""""""""""""""""
""" YCM setting
set completeopt-=preview

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1 
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>

""" NERD commenter setting
let g:NERDCustomDelimiters = {'tex':{'left': '%'}}
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""" airline setting
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='afterglow'
let g:airline_powerline_fonts = 0

""" neomake setting
call neomake#configure#automake('nrwi')
let g:neomake_open_list = 2

""" nerdtree setting
" put NERDTree in the leftside
let NERDTreeWinPos="left" 
"" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 				
nmap <F4> :MundoToggle<cr>
nmap <F5> :ToggleNERDTreeAndTagbar <cr>

""" TagBar setting
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
