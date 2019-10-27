" -- Compability -- "

set encoding=utf-8  " always encode in utf
set nocompatible    " use vim defaults instead of vi

" -- Plugins -- "

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'neomake/neomake'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'ipod825/vim-netranger'
Plug 'henrik/vim-open-url'
call plug#end()

" -- Settings -- "

" File detection
filetype indent plugin on
syntax on

" General
set autoread                  " auto refresh any file not being edited by Vim
set background=dark           " dark background
set directory^=$HOME/backups/ " put all swap files together in one place
set backspace=2               " enable <BS> for everything
set completeopt-=preview      " dont show preview window
set fillchars+=vert:\         " empty space instead of broken line for vsplits
set hidden                    " hide when switching buffers, don't unload
set laststatus=2              " always show status line
set mouse=a                   " enable mouse in all modes
set wrap                      " word wrap
set linebreak                 " attempt to wrap lines cleanly
set number                    " show line numbers
set cursorline                " highlight cursor line
set title                     " use filename in window title
set ttyfast                   " you've got a fast terminal
set spelllang=en

" Folding
set foldignore=               " don't ignore anything when folding
set foldlevelstart=99         " no folds closed on open
set foldmethod=indent         " collapse code using indentations

" Tabs
set autoindent                " copy indent from previous line
set expandtab                 " replace tabs with spaces
set shiftwidth=4              " spaces for autoindenting
set smarttab                  " <BS> removes shiftwidth worth of spaces
set softtabstop=2             " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2                 " spaces for <Tab>

" Panes
set splitbelow
set splitright

" Searches
set hlsearch                  " highlight search results
set incsearch                 " search whilst typing
set ignorecase                " case insensitive searching
set smartcase                 " override ignorecase if upper case typed
set showcmd                   " show command on last line of screen
set showmatch                 " show bracket matches
set textwidth=80              " break lines after 80 char width
"set colorcolumn=80
set wildmenu                  " enhanced cmd line completion
set ruler                     " shows ruler
set clipboard+=unnamed        " use the clipboards of vim and win
set go+=a                     " automatically copy to clipboard

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
nnoremap <S-o> O<Esc>

" Search for trailing whitespaces
nnoremap <leader>w /\s\+$<CR>

" Remove trailing whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle method used for folding
nnoremap mm :call ToggleFoldMethod()<CR>

" Paste mode for terminals
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Yank (copy) selection to clipboard
nnoremap <C-c> "+y

" Put (paste) from clipboard
nnoremap <C-p> "*p

" vim-netranger
nnoremap <leader>n :e %:p:h<CR>
nnoremap <leader>v :vsp<CR>:e %:p:h<CR>
nnoremap <C-n> :tabe<CR>:e %:p:h<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fix indentation
nnoremap <F10> gg=G<C-o><C-o>

" A better gx
"nnoremap gx :normal mxviugx<Esc>

" Panes
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>
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

" Page tabs
"nnoremap <C-n> :tabe<CR>:Explore!<CR>
nnoremap <C-k> gt
nnoremap <C-j> gT
nnoremap <C-1> 1gt
nnoremap <C-2> 2gt
nnoremap <C-3> 3gt
nnoremap <C-4> 4gt
nnoremap <C-5> 5gt
nnoremap <C-6> 6gt
nnoremap <C-7> 7gt
nnoremap <C-8> 8gt
nnoremap <C-9> 9gt
nnoremap <C-0> :tablast<CR>

" :tabs      list all tabs including their displayed windows
" :tabm 0    move current tab to first
" :tabm      move current tab to last
" :tabm {i}  move current tab to position i+1

" -- Other Settings -- "

let g:vimtex_view_method = 'zathura'
let g:deoplete#enable_at_startup = 1
let g:NETRColors = {'cwd':'white', 'footer': 'yellow', 'link': 'white', 'dir': 'blue', 'exe': 'green'}
let g:open_url_browser='xdg-open'

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
