"general settings
"------------------------------------"
set nocompatible

set clipboard=unnamed

"search settings"
set hlsearch
set ignorecase
set incsearch

syntax on
set number

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

let g:editorconfig = v:true

"backspace settings"
set backspace=indent,eol,start

"plugin settings
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'hashivim/vim-terraform'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'ruanyl/vim-gh-line'
Plug 'scrooloose/nerdtree'
Plug 'sodapopcan/vim-twiggy'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'windwp/nvim-autopairs'

call plug#end()

"load plugin settings"
for settings in split(glob('~/.config/nvim/plugin-settings/*'), '\n')
    exe 'source' settings
endfor

let g:airline_powerline_fonts = 1
