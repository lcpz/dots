" -- Compability -- "

set encoding=utf-8  " always encode in utf
set nocompatible    " use vim defaults instead of vi

" -- Plugins -- "

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/nerdtree'
Plugin 'spolu/dwm.vim'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

" -- Settings -- "

" File detection
filetype plugin indent on
syntax on

" General
set background=dark            " dark background
set directory^=$HOME/backups/  " put all swap files together in one place
set backspace=2                " enable <BS> for everything
set completeopt-=preview       " dont show preview window
set fillchars+=vert:\          " empty space instead of broken line for vsplits 
set hidden                     " hide when switching buffers, don't unload
set laststatus=2               " always show status line
set lazyredraw                 " don't update screen when executing macros
set mouse=a                    " enable mouse in all modes
set wrap                       " word wrap
set linebreak                  " attempt to wrap lines cleanly
set number                     " show line numbers
set cursorline                 " highlight cursor line
set title                      " use filename in window title
set ttyfast                    " you've got a fast terminal

" Folding
set foldignore=                " don't ignore anything when folding
set foldlevelstart=99          " no folds closed on open
set foldmethod=marker          " collapse code using markers

" Tabs
set autoindent                 " copy indent from previous line
set expandtab                  " replace tabs with spaces
set shiftwidth=4               " spaces for autoindenting
set smarttab                   " <BS> removes shiftwidth worth of spaces
set softtabstop=2              " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2                  " spaces for <Tab>

" Searches
set hlsearch                   " highlight search results
set incsearch                  " search whilst typing
set ignorecase                 " case insensitive searching
set smartcase                  " override ignorecase if upper case typed
set showcmd                    " show command on last line of screen
set showmatch                  " show bracket matches
set textwidth=0                " don't break lines after some maximum width
set wildmenu                   " enhanced cmd line completion
set ruler                      " shows ruler
set clipboard+=unnamed         " use the clipboards of vim and win
set go+=a                      " Visual selection automatically copied to the clipboard

" Colours
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid 

" gVim
if has('gui_running')
  set guioptions-=m                " remove menu
  set guioptions-=T                " remove toolbar
  set guioptions-=r                " remove right scrollbar
  set guioptions-=b                " remove bottom scrollbar
  set guioptions-=L                " remove left scrollbar
  set guifont=Tamsyn\ 10.5         " setting gui font
  set guicursor+=a:block-blinkon0  " always use block cursor, no cursor blinking
  colorscheme jellybeans
  " Paste from PRIMARY and CLIPBOARD
  inoremap <silent> <M-v> <Esc>"+p`]a
  inoremap <silent> <S-Insert> <Esc>"*p`]a
endif

" vimdiff
if &diff
  set diffopt=filler,foldcolumn:0
endif

" -- Mappings -- "

" Map leader
let mapleader = ','

" Exit insert mode
inoremap jj <esc>

" Toggle fold
nnoremap <space> za

" Toggle spellcheck
nnoremap <leader>s :set spell!<CR>

" Toggle hlsearch for current results
nnoremap <leader><leader> :nohlsearch<CR>

" Insert newline in normal mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Search for trailing whitespace
nnoremap <leader>w /\s\+$<CR>

" Toggle method used for folding
nnoremap <leader>m :call ToggleFoldMethod()<CR>

" Paste mode for terminals
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Insert current date and time
nnoremap <leader>d "=strftime("%d %b, %Y %X")<CR>p
nnoremap <leader>D "=strftime("%d %b, %Y %X")<CR>P

" Shortcut for Tabularize
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /

" Search and open buffer, files, recent
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>

" -- Plugin Settings -- "

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|__pycache__$',
      \ 'file': '\.pyc$\|\.so$\|\.swp$',
      \ }

let g:dwm_master_pane_width=96
let g:gitgutter_max_signs = 10000

" -- Functions -- "

function! ToggleFoldMethod()
if &foldmethod == 'indent'
  set foldmethod=marker
  echo "foldmethod=marker"
else
  set foldmethod=indent
  echo "foldmethod=indent"
endif
endfunction
