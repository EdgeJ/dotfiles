"set gvim color scheme
colorscheme darkblue
"set gvim font
if g:os == "Darwin"
    set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h12
elseif g:os == "Linux"
    set guifont=Roboto\ Mono\ for\ Powerline\ 11
endif
set guioptions=ce
"              ||
"              |+-- use simple dialogs rather than pop-ups
"              +  use GUI tabs, not console style tabs
set guioptions=-T
set guioptions=-M
set guitablabel=%t
set mousehide " hide the mouse cursor when typing
