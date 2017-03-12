"set gvim color scheme
colorscheme darkblue
"set gvim font
if g:os == "Darwin"
    set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h12
elseif g:os == "Linux"
    set guifont=Roboto\ Mono\ for\ Powerline\ 11
endif
