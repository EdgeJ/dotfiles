"map <F8> to toggle NERDTree
map <F8> :NERDTreeToggle<CR>

"cd to the currently open node in NERDTree
let NERDTreeChDirMode=2
"ignore compiled python
let NERDTreeIgnore=['\~$', 'py[oc]$']

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeCascadeSingleChildDir = 0

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
