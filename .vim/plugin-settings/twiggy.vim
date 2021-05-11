"map <F7> to toggle Twiggy
map <F7> :Twiggy<CR>

"close vim if Twiggy is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:Twiggy") && b:Twiggy.isTabTree()) | q | endif
