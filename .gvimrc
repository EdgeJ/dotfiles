"set gvim color scheme
colorscheme darkblue
"set gvim font
let g:os = substitute(system('uname'), '\n', '', '')
if g:os == "Darwin"
    set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h12
elseif g:os == "Linux"
    set guifont=Fira\ Mono\ 10
endif
