set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins start here"

Plugin 'ervandew/supertab'
Plugin 'dense-analysis/ale'
Plugin 'fatih/vim-go'
Plugin 'GEverding/vim-hocon'
Plugin 'godlygeek/tabular'
Plugin 'hashivim/vim-terraform'
Plugin 'honza/vim-snippets'
Plugin 'kristijanhusak/vim-create-pr'
Plugin 'moll/vim-bbye'
Plugin 'pearofducks/ansible-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'ruanyl/vim-gh-line'
Plugin 'scrooloose/nerdtree'
Plugin 'shime/vim-livedown'
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/groovyindent-unix'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'yssl/QFEnter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
