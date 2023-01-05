-- Based on https://github.com/nvim-lua/kickstart.nvim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').init({ display = { working_sym = '◦'}})

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Keep Mason updated
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use { 'nvim-telescope/telescope-file-browser.nvim' }

  -- Manage surroundings in pairs
  use 'tpope/vim-surround'

  -- Automatic pairs
  use 'windwp/nvim-autopairs'

  -- LaTeX support
  use 'lervag/vimtex'

  -- Better bufferline
  use 'akinsho/bufferline.nvim'

  use { -- Tree-like file system explorer
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Additional jump motions
  use 'ggandor/leap.nvim'
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Enable 24-bit RGB colors
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Empty space instead of broken line for vsplits
vim.cmd [[set fillchars+=vert:\]]

-- Do not insert the current comment leader automatically
vim.o.formatoptions = 'tqj'

-- Highlight cursor line
vim.o.cursorline = true

-- Panes
vim.o.splitbelow = true
vim.o.splitright = true

-- Searches
vim.o.ignorecase = true -- Case insensitive
vim.o.smartcase = true  -- Override ignorecase if upper case typed

-- Highlight column 80
vim.o.colorcolumn = '80'

-- Use the clipboards of nvim and win
vim.o.clipboard = 'unnamed'

-- Basic Keymaps
-- `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Set colorscheme
require('onedark').load()

-- Set automatic pairs
require('nvim-autopairs').setup()

-- Set Leap motions
require('leap').add_default_mappings()

-- Set bufferline
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

-- Set lualine as statusline
-- `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
    extensions = {'neo-tree', 'fugitive' }
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '│',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Enable Telescope's fuzzy finder
pcall(require('telescope').load_extension, 'fzf')

-- Enable Telescope's file browser
pcall(require('telescope').load_extension, 'file_browser')

local fb_actions = require('telescope').extensions.file_browser.actions

-- Configure Telescope
-- `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    file_browser = {
      mappings = {
        ['n'] = {
          ['h'] = fb_actions.goto_parent_dir,
          ['l'] = fb_actions.change_cwd
        }
      }
    }
  }
}

-- `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', { desc = '[F]ile [B]rowser' })

-- Configure Treesitter
-- `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'java', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- This function is run when an LSP connects to a particular buffer
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc and 'LSP: ' .. desc or ''})
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-s>h', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
local servers = {
  clangd = {},
  jdtls = {},
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- Broadcast nvim-cmp completion capabilities to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup Mason so it can manage external tooling
require("mason").setup({
  ui = {
    icons = {
      package_installed = "•",
      package_pending = "➜",
      package_uninstalled = "◦"
    }
  }
})

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

require('mason-tool-installer').setup {
  auto_update = true,
  run_on_start = true,
  start_delay = 3000, -- ms delay
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Toggle spellcheck
vim.keymap.set('n', '<leader>s', ':set spell!<CR>')

-- Insert newline in normal mode
vim.keymap.set('n', '<S-o>', 'O<Esc>')

-- Search for trailing whitespaces
vim.keymap.set('n', '<leader>w', '/\\s\\+$<CR>')

-- Remove trailing whitespaces
vim.keymap.set('n', '<F5>', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>', { silent = true })

-- Paste mode for terminals
vim.keymap.set('n', '<F2>', ':set invpaste paste?<CR>')
vim.o.pastetoggle = ('<F2>')

-- Yank (copy) selection to global clipboard
vim.keymap.set('v', '<C-c>', '+yi')

-- Put (paste) from global clipboard
vim.keymap.set('i', '<C-v>', '<Esc>"+gpi')

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree toggle show<CR>')
vim.keymap.set('n', '<leader>k', ':Neotree dir=..<CR>')
vim.keymap.set('n', '<leader>w', ':Neotree toggle current reveal_force_cwd<CR>')

-- Code action suggestions
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')

-- Panes
vim.keymap.set('n', '<S-j>', '<C-w><C-j>')
vim.keymap.set('n', '<S-k>', '<C-w><C-k>')
vim.keymap.set('n', '<S-l>', '<C-w><C-l>')
vim.keymap.set('n', '<S-h>', '<C-w><C-h>')
vim.keymap.set('n', '<F6>', '<C-w><', { silent = true })
vim.keymap.set('n', '<F7>', '<C-w>>', { silent = true })
vim.keymap.set('n', '<F8>', '<C-w>-', { silent = true })
vim.keymap.set('n', '<F9>', '<C-w>+', { silent = true })

-- Ctrl+W R  Swap top/bottom or left/right split
-- Ctrl+W T  Break out current window into a new tabview
-- Ctrl+W o  Close every window in the current tabview but the current one

-- Ctrl+W _  Max out the height of the current split
-- Ctrl+W |  Max out the width of the current split
-- Ctrl+W =  Normalize all split sizes

-- Buffer navigation
vim.keymap.set('n', '<C-k>', 'gt', { noremap = true })
vim.keymap.set('n', '<C-j>', 'gT', { noremap = true })
vim.keymap.set('n', '<C-0>', ':tablast<CR>')

-- :tabs      List all tabs including their displayed windows
-- :tabm 0    Move current tab to first
-- :tabm      Move current tab to last
-- :tabm {i}  Move current tab to position i+1

-- Other settings
vim.g.vimtex_view_method = 'zathura'
vim.g.open_url_browser = 'xdg-open'

-- `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
