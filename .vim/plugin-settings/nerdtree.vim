"position NERDTree on the right
let g:NERDTreeWinPos = "right"

"automatically start NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd w

"map <F8> to toggle NERDTree
map <F8> :NERDTreeToggle<CR>

"cd to the currently open node in NERDTree
let NERDTreeChDirMode=2
"ignore compiled python
let NERDTreeIgnore=['\~$', 'py[oc]$']

"close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif