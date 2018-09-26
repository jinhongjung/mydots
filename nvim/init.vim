""""""""""""""""""""""""""""
"""" Basic setup
""""""""""""""""""""""""""""
call plug#begin()

"" Plugins for pythons
"Plug 'fisadev/vim-isort'                       " python import sort
Plug 'vim-scripts/indentpython.vim'             " python indentation
Plug 'hdima/python-syntax'                      " python syntax
Plug 'nvie/vim-flake8'                          " python pep8

"" Plugins for latex
Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

"" Plugins for IDE
"""""" powerline plugins
Plug 'vim-airline/vim-airline'                  " airline (powerline)
Plug 'vim-airline/vim-airline-themes'           " vim-airline themes
"""""" snippets plugins
Plug 'SirVer/ultisnips'                         " snippets
Plug 'honza/vim-snippets'                       " snippets
" auto completers
"Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'                     " auto-completer for python/latex
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'                      " asynchronous auto-completer
Plug 'ervandew/supertab'                        " tab completer
"""""" searcher and file/tag navigators
Plug 'kien/ctrlp.vim'                           " fuzzy search
Plug 'scrooloose/nerdtree'                      " file navigator
"Plug 'pseewald/nerdtree-tagbar-combined'
Plug 'Shougo/unite.vim'                         " fuzzy search
Plug 'Shougo/vimfiler.vim'                      " file navigator
Plug 'majutsushi/tagbar'                        " displays tags in a window
" git plugins
Plug 'tpope/vim-fugitive'                       " git integration
Plug 'airblade/vim-gitgutter'                   " git diff line by line
" build/run plugins
Plug 'neomake/neomake'
Plug 'skywind3000/asyncrun.vim'                 " run something asynchronously
"""""" commenters
Plug 'scrooloose/nerdcommenter'                 " easy-commenting

"" Plugins for editing and navigating
Plug 'ntpeters/vim-better-whitespace'           " remove unnecessary whitespacessss
Plug 'dhruvasagar/vim-table-mode'               " table for vim
Plug 'easymotion/vim-easymotion'                " fast navigating a file
Plug 'tmhedberg/matchit'                        " extended % matching
Plug 'xolox/vim-notes'                          " vim notes
Plug 'xolox/vim-misc'                           " misc for other plugins

"" Lab - Plugins for testing
Plug 'dsimidzija/vim-nerdtree-ignore'           " nerdtreeignore
"Plug 'haya14busa/vim-gtrans'
Plug 'vim-scripts/Google-Translate'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'wellle/tmux-complete.vim'
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


""" for vim slow issues
set nocompatible
set ttyfast
set lazyredraw
" set synmaxcol=256
syntax sync minlines=256


""" display 80 characters line for only python scripts
set colorcolumn=0
augroup python_columns     " source vim configuration upon save
au!
    autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    autocmd FileType python match OverLength /\%81v.\+/
    autocmd FileType python set colorcolumn=80
augroup END


""" remove trailing whitespace for python scripts in vim
"function! <SID>StripTrailingWhitespaces()
    "let l = line(".")
    "let c = col(".")
    "%s/\s\+$//e
    "call cursor(l, c)
"endfun
""autocmd BufWritePre *.py :%s/\s\+$//e
"autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()


""" global indentation setting
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set autoindent
set smartindent
set smarttab
set expandtab

" for python indentation
au BufNewFile,BufRead *.py :
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set shiftwidth=4 |
		\ set textwidth=79 |
		\ set expandtab |
		\ set autoindent |
		\ set fileformat=unix |

" for text indentation
au BufRead,BufNewFile *.txt :
        \ set breakindent |
        \ set breakindentopt=shift:2 |

" for tex indentation
au BufRead,BufNewFile *.tex :
        \ set breakindent


""" clipboard setting
set clipboard=unnamedplus


""" fold setting
set foldlevelstart=20 " open all folds when opening a file


""" vim spell-checker setting
set dictionary+=/usr/share/dict/words
set complete+=kspell
set nospell
map <silent> <leader>en :setlocal spell spelllang=en spelllang? <CR>
inoremap <silent> <C-s> <C-x><C-k>
" set spell spelllang=en_us
" set complete+=k
" set completeopt+=noinsert
" set cmdheight=1


""" vim compiler setting
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

""" key map settings
inoremap jk <ESC>
let mapleader=" "
let maplocalleader=" "

" function key map
nmap <F2> :so $MYVIMRC<CR>
nmap <F3> :NERDTreeToggle <cr>
nmap <F4> :Tagbar <cr>
nnoremap <F5> :call <SID>compile_and_run()<CR><CR>
map <F6> <C-P><C-\>w
noremap <F9> :call asyncrun#quickfix_toggle(8)<CR>

" shortcuts vim-note
nnoremap <leader>s :SearchNotes<space>
nnoremap <leader>n :Note<space>

" shortcuts for resizing a pane
nnoremap <silent> <leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>0 :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>9 :exe "vertical resize " . (winwidth(0) * 2/3)<CR>


"" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" unset the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" etc
nnoremap <leader>w :StripWhitespace<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>v :NERDTreeFind<CR>


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

let $PYTHONUNBUFFERED=1 " no python stdout buffering


""" vimrc auto-load
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END


""" wrap settings
set wrap lbr
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$



""""""""""""""""""""""""""""
"""" Plugin setup
""""""""""""""""""""""""""""
""" YCM setting (deprecated)
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
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
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = "<leader>gk"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#rename_command = "<leader>gr"


""" deoplete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 1000
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
"let g:deoplete#sources={
  "\ 'play': ['dictionary']
"  \ }
"le:deoplete#sources_pandoc = ['buffer', 'dictionary', 'member']
"let g:deoplete#sources#jedi#debug_server = 1
"autocmd FileType python setlocal completeopt-=preview
"let g:pymode_rope = 0
"let g:jedi#auto_vim_configuration = 0


""" supertab setting
let g:SuperTabDefaultCompletionType = "<C-n>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


""" NERD commenter setting
let g:NERDCustomDelimiters = {'tex':{'left': '%'}}
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


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
let NERDTreeIgnore=['.DS_Store', '\.pyc$', '\~$', '__pycache__',
            \ '\.aux', '\.fdb_latexmk', '\.fls',
            \ '\.synctex.gz', '\.bbl', '\.blg']
" let NERDTreeQuitOnOpen = 1


""" tagbar setting
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


""" vim-table-mode setting
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


""" vim-better-whitespace setting
let g:better_whitespace_enabled=1
"let g:better_whitespace_operator='-s'
let g:strip_whitespace_on_save = 1
let g:show_spaces_that_precede_tabs=1
let g:strip_whitelines_at_eof=1


""" vimtex setting
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
		\ 'backend' : 'nvim',
		\ 'background' : 1,
		\ 'build_dir' : '',
		\ 'callback' : 1,
		\ 'continuous' : 1,
		\ 'executable' : 'latexmk',
		\ 'options' : [
		\   '-file-line-error',
		\   '-synctex=1',
		\   '-interaction=nonstopmode',
		\ ],
		\}
"'-verbose',
let g:vimtex_quickfix_enabled = 2
let g:vimtex_quickfix_open_on_warning = 1
" let g:vimtex_quickfix_latexlog = {
      " \ 'overfull' : 0,
      " \ 'underfull' : 0,
      " \ 'packages' : {
      " \   'default' : 0,
      " \ },
      " \}
"
" let g:vimtex_quickfix_autojump = 1
"let g:vimtex_view_automatic = 1
let g:vimtex_view_method = 'skim'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
        call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete


"" ctrlp setting
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux


"" gtranslate setting
let g:langpair="ko"
let g:vtranslate="T"
