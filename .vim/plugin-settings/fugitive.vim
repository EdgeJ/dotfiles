"map <F6> to toggle git buffer
map <F6> :Git<CR>

"close vim if git is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:fugitive") && b:fugitive.isTabTree()) | q | endif
