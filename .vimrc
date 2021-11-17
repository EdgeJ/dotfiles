"disable settings for large files"
"------------------------------------"
function LargeFile()
    set eventignore+=FileType
    setlocal bufhidden=unload
    setlocal undolevels=-1
    autocmd VimEnter * echo "This file is larger than "
        \ . (g:LargeFile / 1024 / 1024) . "MB, so some options have been"
        \ "disabled."
endfunction

let g:LargeFile = 1024 * 1024 * 20
augroup LargeFile
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) |
        \ if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

"general settings
"------------------------------------"
"what os are we"
let g:os = substitute(system('uname'), '\n', '', '')

"enable mouse settings"
set ttyfast
set mouse=a
set ttymouse=xterm

"enable copying to os clipboard"
if g:os == "Darwin"
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

"search settings"
set hlsearch
set ignorecase

"open vimgrep always in quickfix"
augroup grepwindow
    autocmd!
    autocmd QuickFixCmdPost [^l]* botright cwindow
    autocmd QuickFixCmdPost l*    botright lwindow
augroup END

"store backups in a single location"
set directory=$HOME/.vim/swapfiles/

"load plugin settings"
if has("gui")
    for settings in split(glob('~/.vim/plugin-settings/*'), '\n')
        exe 'source' settings
    endfor
endif

"always open livedown preview for markdown files
let g:livedown_autorun = 1
let g:livedown_port = 8337

"key maps"
"------------------------------------"
"
"really delete things without putting them in the buffer
nnoremap <leader>d "_d
xnoremap <leader>d "_d
map <F2> :bot terminal<CR>
map <F4> :execute "vimgrep! /" . expand("<cword>") . "/j **" <Bar> :botright cw<CR>
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

"------------------------------------"
"set syntax highlighting and display settings"
syntax on
filetype on
set background=dark
set number

"powerline font settings if running in gvim"
if has("gui")
    let g:airline_powerline_fonts = 1
endif

"editing settings and filetypes"
"------------------------------------"
"set tabs to 4 spaces"
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab textwidth=79
"with a few exceptions"
au FileType html,htmldjango,javascript,ruby,yaml
    \ set tabstop=2 shiftwidth=2 softtabstop=2
au FileType perl
    \ set tabstop=8 shiftwidth=8 softtabstop=8
au FileType puppet set textwidth=140

"associate *.j2 files with htmldjango filetype"
augroup jinjatemplates
    au BufRead,BufNewFile *.j2 setfiletype htmldjango
augroup end

"backspace settings"
set backspace=indent,eol,start

"command aliases"
"------------------------------------"
command E Explore
command Q qa
command Resize vertical resize 80
command BD Bdelete

"load any local settings"
"------------------------------------"
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
