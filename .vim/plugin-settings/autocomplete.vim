" autocompletion settings for YouCompleteMe and UltiSnips
"
" UltiSnips settings
if has("python")
    let g:UltiSnipsUsePythonVersion = 2
elseif has("python3")
    let g:UltiSnipsUsePythonVersion = 3
endif
let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"


" YouCompleteMe settings
let g:ycm_key_list_select_completion = ['<C-n>', 'j']
let g:ycm_key_list_previous_completion = ['<C-p>', 'k']
let g:SuperTabDefaultCompletionType = '<C-n>'
