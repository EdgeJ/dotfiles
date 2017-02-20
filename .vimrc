"disable settings for large files"
function LargeFile()
    set eventignore+=FileType
    setlocal bufhidden=unload
    setlocal undolevels=-1
    autocmd VimEnter * echo "This file is larger than " . (g:LargeFile / 1024 / 1024) . "MB, so some options have been disabled."
endfunction

let g:LargeFile = 1024 * 1024 * 20
augroup LargeFile
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

"load Vundle settings"
:source ~/.vim/vundle.vim

"load syntastic"
:source ~/.vim/syntastic.vim

"load airline settings"
:source ~/.vim/airline.vim

"load NERDTree settings"
:source ~/.vim/nerdtree.vim

"netrw settings"
"let g:netrw_liststyle=3
"let g:netrw_banner=0
"let g:netrw_list_hide='*/*.swp$'
"let g:netrw_chgwin=1
""start netrw
":rightbelow 20vs
":silent e .

"key maps"
"------------------------------------"
"remap shift+enter to bring up netrw as sidebar"
"nnoremap <silent> <C-M> :rightbelow 20vs<CR>:e .<CR>
"remap CTLR+enter to open files in a new tab"
"nmap <silent> <NL> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>
"map <F4> to search for current word recursively in pwd"
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> :botright cw<CR>
map <F9> :set invnumber<CR>
map <F10> :vertical resize 80<CR>
map <F11> :vertical resize -5<CR>
map <F12> :vertical resize +5<CR>
"numpad mappings
map <esc>Ol :resize +5<CR>
map <esc>OS :resize -5<CR>
imap <esc>Oq 1
imap <esc>Or 2
imap <esc>Os 3
imap <esc>Ot 4
imap <esc>Ou 5
imap <esc>Ov 6
imap <esc>Ow 7
imap <esc>Ox 8
imap <esc>Oy 9
imap <esc>Op 0
imap <esc>On .
"map buffer navigation keys
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

"------------------------------------"
"set syntax highlighting and display settings"
syntax on
filetype on
set background=dark
set number

"powerline font settings if running in gvim
if has("gui")
    let g:airline_powerline_fonts = 1
endif

"set tabs to 4 spaces"
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"with a few exceptions
au BufNewFile,BufRead *.js, *.html, *.css, *.yaml
    \ set tabstop=2 shiftwidth=2 softtabstop=2

"command aliases
command E Explore
command Q qa
command Resize vertical resize 80
"enable mouse settings"
set ttyfast
set mouse=a
set ttymouse=xterm

"enable copying to os clipboard"
set clipboard=unnamed

"highlight search results"
set hlsearch
"log editing settings
augroup logfiles
    au BufNewFile *.log set tw=79
    "decom worklog boilerplate"
    augroup decom.log
        au BufNewFile *.decom.log 0r ~/.vim/decom.skel
    augroup end
augroup end

"don't format md files"
au BufRead,BufNewFile *.md set filetype=text

"backspace settings"
set backspace=indent,eol,start
