"general settings
"------------------------------------"
set nocompatible

set clipboard=unnamed

"search settings"
set hlsearch
set ignorecase
set incsearch

syntax on

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

let g:editorconfig = v:true

"backspace settings"
set backspace=indent,eol,start

"plugin settings
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'neovim/nvim-lspconfig'
Plug 'ruanyl/vim-gh-line'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'sodapopcan/vim-twiggy'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

call plug#end()

"load plugin settings"
for settings in split(glob('~/.config/nvim/plugin-settings/*'), '\n')
    exe 'source' settings
endfor
