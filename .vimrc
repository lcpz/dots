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
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'thaerkh/vim-workspace'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'troydm/zoomwintab.vim'
Plug 'preservim/tagbar'
Plug 'akinsho/bufferline.nvim'
Plug 'williamboman/mason.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'ThePrimeagen/harpoon'
call plug#end()

lua << EOF
require('nvim-autopairs').setup()

require('neo-tree').setup {
    default_component_configs = {
        indent = {
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            with_expanders = false,
        },
        icon = {
            folder_closed = '•',
            folder_open = '◘',
            folder_empty = '◦',
            default = '-',
            highlight = 'NeoTreeFileIcon'
        },
        git_status = {
            symbols = {
                -- Change type
                added     = '',
                modified  = '',
                deleted   = 'x',
                renamed   = 'r',
                -- Status type
                untracked = 'u',
                ignored   = 'i',
                unstaged  = 'n',
                staged    = 's',
                conflict  = 'c',
            }
        }
    }
}

require('telescope').load_extension('file_browser')

require('bufferline').setup {
    options = {
        mode = "tabs",
        offsets = {
            { filetype = "neo-tree", text = "", padding = 1 },
        },
        indicator = {
            style = 'none',
        },
        modified_icon = "~",
        close_icon = "",
        separator_style = { "" , ""},
        show_buffer_close_icons = false,
        always_show_bufferline = false,
    },
    highlights = {
        background = {
            ctermfg = 8
        },
        buffer_selected = {
            ctermfg = 15,
            ctermbg = 0,
            bold = false
        }
    }
}

require('mason').setup()

local cmp = require('cmp')

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm { select = true }
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }
    }, {
      { name = 'buffer' }
    })
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')
local language_servers = {'clangd', 'jdtls'}

for _, lsp in pairs(language_servers) do
    lspconfig[lsp].setup { capabilities = capabilities }
end
EOF

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
set number                    " show line number (cursor)
set relativenumber            " show relative line numbers (w.r.t. cursor)
set cursorline                " highlight cursor line
set title                     " use filename in window title
set ttyfast                   " you've got a fast terminal
set signcolumn=number
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
set textwidth=90              " break lines after 80 char width
set colorcolumn=90
set wildmenu                  " enhanced cmd line completion
set ruler                     " shows ruler
set clipboard+=unnamed        " use the clipboards of vim and win
set go+=a                     " automatically copy to clipboard

" Persistent undo
set undodir=~/.vim/undodir
set undofile

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

" Yank (copy) selection to global clipboard
vmap <C-c> "+yi

" Put (paste) from global clipboard
imap <C-v> <esc>"+gpi

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fix indentation
nnoremap <F10> gg=G<C-o><C-o>

" Workspaces
nnoremap <leader>W :ToggleWorkSpace<CR>

" Neotree
nnoremap <space>e :Neotree toggle show<CR>
nnoremap <space>k :Neotree dir=..<CR>
nnoremap <space>w :Neotree toggle current reveal_force_cwd<CR>

" Telescope (requires fd)
nnoremap <space>ff <cmd>Telescope find_files<CR>
nnoremap <space>fg <cmd>Telescope live_grep<CR>
nnoremap <space>fb <cmd>Telescope file_browser<CR>
nnoremap <space>fh <cmd>Telescope help_tags<CR>

" Tagbar (requires ctags)
nnoremap <space>tr :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']

" LSP config
nnoremap <space>ca :lua vim.lsp.buf.code_action()<CR>

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
let g:open_url_browser='xdg-open'
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_session_disable_on_args = 1

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
