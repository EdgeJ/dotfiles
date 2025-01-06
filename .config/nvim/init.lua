require('utils')

-- general settings
vim.opt.clipboard = 'unnamed'

-- search settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

--- display settings
vim.opt.number = true
vim.cmd('syntax on')
vim.opt.listchars = 'tab:<->,trail:-,eol:$'

--- space settings
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local filetypes_with_two_spaces = {'html', 'htmldjango', 'javascript', 'ruby', 'sh', 'yaml'}

set_tabwidth_for_filetypes(filetypes_with_two_spaces, 2)
set_tabwidth_for_filetypes({'go'}, 8)

vim.g.editorconfig = true

vim.opt.backspace = {'indent', 'eol', 'start'}

-- plugin settings
vim.call('plug#begin')

Plug('b0o/schemastore.nvim')
Plug('dracula/vim', { ['as'] = 'dracula' })
Plug('git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/vim-vsnip')
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('ray-x/lsp_signature.nvim')
Plug('ruanyl/vim-gh-line')
Plug('sodapopcan/vim-twiggy')
Plug('tpope/vim-fugitive')
Plug('vim-airline/vim-airline')
Plug('windwp/nvim-autopairs')

vim.call('plug#end')

-- load plugin settings
require('plugin_settings/gitlab')
require('plugin_settings/lsp')
require('plugin_settings/nvim-cmp')
require('plugin_settings/nvim-tree')
require('plugin_settings/treesitter')

vim.g.airline_powerline_fonts = 1

-- load gui settings if running in neovide
if vim.g.neovide then
    vim.cmd('source ~/.config/nvim/ginit.vim')
end
