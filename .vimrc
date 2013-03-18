" Last modified: 2013 Mar 10
" Author: Amir Salihefendic <http://amix.dk>
" Modifier: Lucy Park <me@lucypark.kr>
" Feel free to do whatever you want with this file.
" Just make sure to credit what deserve credits.
"
" Sections:
"    1. General
"    2. Search
"    3. Colors and fonts
"    4. Files and backups
"    5. Text, tab and indent related
"    6. Moving around, tabs, buffers
"    7. Status line
"    8. Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. General
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Sets how many lines of history VIM has to remember
set history=700

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch 

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Start searching when you type as in modern browsers
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

try
    let g:solarized_termtrans=1
    set background=dark
    colorscheme solarized
    set t_Co=256
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, Git, etc anyway...
set nobackup
set nowb
set noswapfile

" Prompt yes/no/cancel on closing with unsaved changes
set confirm

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5. Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" One tab equals four space
set shiftwidth=4

" Delete trailing whitespaces on save for python
func! DeleteTrailingWhitespaces()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWhitespaces()

" Line numbering
set number

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6. Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around)
map j gj
map k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7. Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\                          "File, Modified? Readonly? 
set statusline+=\ %y\                                   "FileType
set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''}]     "Encoding
set statusline+=\ %=\ row:%l/%L\ (%02p%%)\              "Rownumber/total (%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8. Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" Use file templates
autocmd! BufNewFile * silent! 0r ~/.vim/skel/template.%:e

" Enable pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
