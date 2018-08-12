""""""""""""""""""""""""""""
"""" Basic setup
""""""""""""""""""""""""""""
call plug#begin()
"Plug 'fisadev/vim-isort'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'    " a tree explorer plugin for vim
"Plug 'pseewald/nerdtree-tagbar-combined'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'  " a vim plugin that displays tags in a window
Plug 'easymotion/vim-easymotion'  " a motion plugin for fast navigating a file
Plug 'scrooloose/nerdcommenter'   " a plugin for easy-commenting
Plug 'tmhedberg/matchit'  " extended % matching
Plug 'vim-scripts/indentpython.vim'   " python indentation
"Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive' " git integration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hdima/python-syntax'
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'skywind3000/asyncrun.vim'

"Plug 'cjrh/vim-conda'
call plug#end()
filetype plugin indent on

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
syntax on
let python_highlight_all = 1

"" for vim slow issues
set nocompatible
set ttyfast
set lazyredraw
set synmaxcol=128
syntax sync minlines=256

"" display 80 characters line for only python scripts
set colorcolumn=0
augroup vimrc_autocmds     " Source vim configuration upon save
au! 
    autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
    autocmd FileType python match OverLength /\%81v.\+/
    autocmd FileType python set colorcolumn=80 
augroup END

""" global indentation setting
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

""" fold setting
set foldlevelstart=20 " open all folds when opening a file

""" vim spell-checker setting
" set spell spelllang=en_us

""" vim compiler setting
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

""" key map setting
inoremap jk <ESC>
let mapleader=" "
nmap <F2> :so $MYVIMRC<CR>
nmap <F3> :NERDTreeToggle <cr>
nmap <F4> :Tagbar <cr>
nnoremap <F5> :call <SID>compile_and_run()<CR><CR>
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr> 
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
nnoremap <C-s> :SearchNotes 
" nnoremap <Space> za

"" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"" unset the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun python3 %"
    elseif &filetype == 'vim'
        exec "!make install-nvim"
    endif
endfunction

let $PYTHONUNBUFFERED=1 " no python std buffering

""" vimrc auto-load
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END



""""""""""""""""""""""""""""
"""" Plugin setup 
""""""""""""""""""""""""""""
""" YCM setting
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"let g:loaded_youcompleteme = 1
"nnoremap <leader>g :YcmCompleter GoTo<CR>
"nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>doc :YcmCompleter GetDoc<CR>

"" jedi setting
let g:jedi#show_call_signatures_delay = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 100
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
"let g:deoplete#sources#jedi#debug_server = 1
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#max_doc_height = 20
let g:jedi#auto_close_doc = 1
let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"
"autocmd FileType python setlocal completeopt-=preview
"let g:pymode_rope = 0
"let g:jedi#auto_vim_configuration = 0


""" supertab setting


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
let g:neomake_open_list = 0
let g:neomake_python_pep8_exe = 'python3'
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202', '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_python_enabled_makers = ['pep8']

""" vimfiler setting
"nmap <F4> :VimFilerExplorer <cr>
"
""autocmd VimEnter * VimFilerExplorer | wincmd p
"autocmd VimEnter * if argc() >= 0 | VimFilerExplorer | wincmd p | endif
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_restore_alternate_file = 1
"let g:vimfiler_tree_indentation = 1
"let g:vimfiler_tree_leaf_icon = '¦'
"let g:vimfiler_tree_opened_icon = '▼'
"let g:vimfiler_tree_closed_icon = '▷'
"let g:vimfiler_file_icon = '-'
"let g:vimfiler_readonly_file_icon = '*'
"let g:vimfiler_marked_file_icon = '√'
""let g:vimfiler_preview_action = 'auto_preview'
"let g:vimfiler_ignore_pattern =
            "\ '^\%(\.git\|\.idea\|\.DS_Store\|\.vagrant\|.stversions'
            "\ .'\|node_modules\|.*\.pyc\)$'
"
"if has('mac')
    "let g:vimfiler_quick_look_command =
                "\ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
"else
    "let g:vimfiler_quick_look_command = 'gloobus-preview'
"endif
"
"call vimfiler#custom#profile('default', 'context', {
            "\ 'explorer' : 1,
            "\ 'winwidth' : 30,
            "\ 'winminwidth' : 30,
            "\ 'toggle' : 1,
            "\ 'columns' : 'type',
            "\ 'auto_expand': 1,
            "\ 'direction' : 'rightbelow',
            "\ 'parent': 0,
            "\ 'explorer_columns' : 'type',
            "\ 'status' : 1,
            "\ 'safe' : 0,
            "\ 'split' : 1,
            "\ 'no_quit' : 1,
            "\ 'force_hide' : 0,
            "\ })
"autocmd FileType vimfiler call s:vimfilerinit()
"autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
            "\ q | endif
"function! s:vimfilerinit()
    "set non
    "set norelativenumber
"endf


""" nerdtree setting
"autocmd VimEnter * NERDTree
" put NERDTree in the leftside
let NERDTreeWinPos="left"
" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
" let NERDTreeQuitOnOpen = 1


""" TagBar setting
"autocmd VimEnter * TagbarOpen
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_autofocus = 0
let g:tagbar_sort = 0
let g:tagbar_compact = 1

""" nerdtree-tagebar setting
"autocmd VimEnter * ToggleNERDTreeAndTagbar

""" ultisnips setting
" trigger configuration. 
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""" pymode setting
"let g:pymode_python = 'python3'
"let g:pymode_syntax_all = 1
"let g:pymode_lint = 1


""" flake8 setting
let g:flake8_show_quickfix=0  " don't show

""" vim-notes setting
let g:notes_directories = ['~/Google Drive/Documents/Notes']
let g:notes_suffix = '.txt'

""" quickfix setting
autocmd FileType qf wincmd J " fix quickfix at bottom
" auto close after selecting one item
"autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR> 

""" vim-isort setting
autocmd FileType python nnoremap <Leader>i :!isort %<CR><CR>

""" asyncrun setting
" asyncrun now has an option for opening quickfix automatically
let g:asyncrun_open = 8

