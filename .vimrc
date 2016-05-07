" -- Compability -- "

set encoding=utf-8  " always encode in utf
set nocompatible    " use vim defaults instead of vi

" -- Plugins -- "

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'w0ng/vim-hybrid'
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
set mouse=a                    " enable mouse in all modes
set wrap                       " word wrap
set linebreak                  " attempt to wrap lines cleanly
set number                     " show line numbers
set cursorline                 " highlight cursor line
set title                      " use filename in window title
set ttyfast                    " you've got a fast terminal
set spelllang=it

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

" Panes
set splitbelow
set splitright

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

" Search for trailing whitespaces
nnoremap <leader>w /\s\+$<CR>

" Remove trailing whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle method used for folding
nnoremap <leader>m :call ToggleFoldMethod()<CR>

" Paste mode for terminals
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Insert current date and time
nnoremap <leader>d "=strftime("%d %B %Y @ %X")<CR>p

" Delete (cut) to clipboard
vnoremap <Leader>x "*x
nnoremap <Leader>x "*x

" Yank (copy) to clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>y "*y

" Put (paste) from clipboard
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader><S-P> "*P
vnoremap <Leader><S-P> "*P

" Explore
nnoremap <C-N> :Sexplore!<CR>
nnoremap <C-M> :Hexplore<CR>
nnoremap <leader>l :Lexplore<CR>

" Shortcut for Tabularize
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /

" Panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <F6> <C-w><
nnoremap <silent> <F7> <C-w>>
nnoremap <silent> <F8> <C-w>-
nnoremap <silent> <F9> <C-w>+

" Swap top/bottom or left/right split                           : Ctrl+W R
" Break out current window into a new tabview                   : Ctrl+W T
" Close every window in the current tabview but the current one : Ctrl+W o

" Max out the height of the current split                       : Ctrl+W _
" Max out the width of the current split                        : Ctrl+W |
" Normalize all split sizes                                     : Ctrl+W =

" -- Other Settings -- "

let g:netrw_liststyle=3

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
