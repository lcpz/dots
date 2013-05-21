" ~/.vimrc
"
" Compability {{{
" -----------------------------------------------------------------------------

set nocompatible         " use vim defaults instead of vi
set encoding=utf-8       " always encode in utf

"}}}
" Install Plugins {{{
" -----------------------------------------------------------------------------

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'w0ng/vim-hybrid'
Bundle 'scrooloose/nerdtree'
Bundle 'adinapoli/vim-markmultiple'

"}}}
" Settings {{{
" -----------------------------------------------------------------------------

" File detection
filetype plugin indent on
syntax on

" General
set directory^=$HOME/backups//   " put all swap files together in one place
set backspace=2                  " enable <BS> for everything
set completeopt-=preview         " dont show preview window
set fcs=vert:│,fold:-            " solid instead of broken line for vert splits
set hidden                       " hide when switching buffers, don't unload
set cursorline                   " highlight cursor line
set laststatus=2                 " always show status line
set lazyredraw                   " don't update screen when executing macros
set mouse=a                      " enable mouse in all modes
set wrap                         " word wrap
set linebreak                    " attempt to wrap lines cleanly
set number                       " show line numbers
set showcmd                      " show command on last line of screen
set showmatch                    " show bracket matches
set spelllang=it                 " spell check with Italian
set textwidth=0                  " don't break lines after some maximum width
set title                        " use filename in window title
set wildmenu                     " enhanced cmd line completion
set ttyfast                      " you've got a fast terminal
set ruler                        " shows ruler

" Folding
set foldignore=                  " don't ignore anything when folding
set foldlevelstart=99            " no folds closed on open
set foldmethod=marker            " collapse code using markers

" Tabs
set autoindent                   " copy indent from previous line
set expandtab                    " replace tabs with spaces
set shiftwidth=4                 " spaces for autoindenting
set smarttab                     " <BS> removes shiftwidth worth of spaces
set softtabstop=2                " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2                    " spaces for <Tab>

" Searches
set hlsearch                     " highlight search results
set incsearch                    " search whilst typing
set ignorecase                   " case insensitive searching
set smartcase                    " override ignorecase if upper case typed

" Colours
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid 

" gVim
if has('gui_running')
  set guioptions-=m               " remove menu
  set guioptions-=T               " remove toolbar
  set guioptions-=r               " remove right scrollbar
  set guioptions-=b               " remove bottom scrollbar
  set guioptions-=L               " remove left scrollbar
  set guifont=Tamsyn
  set guicursor+=a:block-blinkon0 " always use block cursor, no cursor blinking
  " Paste from PRIMARY and CLIPBOARD
  inoremap <silent> <M-v> <Esc>"+p`]a
  inoremap <silent> <S-Insert> <Esc>"*p`]a
endif

" vimdiff
if &diff
  set diffopt=filler,foldcolumn:0
endif

"}}}
" Mappings {{{
" -----------------------------------------------------------------------------

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

" Toggle last active buffer
nnoremap <leader><Tab> :b#<CR>

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

" Check file for errors
nnoremap <leader>c :SyntasticCheck<CR>
" Show Quickfix window for Syntastic errors
nnoremap <leader>e :Errors<CR>

"}}}
" Plugin Settings {{{
" -----------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|__pycache__$',
      \ 'file': '\.pyc$\|\.so$\|\.swp$',
      \ }

"let g:Powerline_symbols='fancy'

set fillchars+=stl:\ ,stlnc:\
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_python_checker_args='--ignore=E501'

"}}}
" Autocommands {{{
" -----------------------------------------------------------------------------

" Omnicompletion
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Indent rules
autocmd FileType markdown setlocal ts=4 sw=4 sts=4 tw=79
autocmd FileType python setlocal ts=4 sw=4 sts=4

"}}}
" Functions {{{
" -----------------------------------------------------------------------------

function! ToggleFoldMethod()
if &foldmethod == 'indent'
  set foldmethod=marker
  echo "foldmethod=marker"
else
  set foldmethod=indent
  echo "foldmethod=indent"
endif
endfunction

function! ToggleRelativeNumber()
if &relativenumber
  set number
else
  set relativenumber
endif
endfunction

"}}}
" Tagbar {{{
"------------------------------------------------------------------------------ 
"autocmd VimEnter * nested :call tagbar#autoopen(1)
nmap <F2> :TagbarToggle<CR>

highlight TagbarHighlight ctermbg=yellow ctermfg=black

let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['→', '▼']
let g:tagbar_autoshowtag = 0

"}}}
