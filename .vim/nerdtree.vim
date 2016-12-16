"position NERDTree on the right
let g:NERDTreeWinPos = "right"

"automatically start NERDTree
autocmd vimenter * NERDTree

"map <F8> to toggle NERDTree
map <F8> :NERDTreeToggle<CR>

"set expand and collapse arrows
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '|'

"close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
