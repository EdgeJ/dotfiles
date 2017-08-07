" autocompletion settings for YouCompleteMe and UltiSnips
"
" UltiSnips settings
if has("python")
    let g:UltiSnipsUsePythonVersion = 2
elseif has("python3")
    let g:UltiSnipsUsePythonVersion = 3
endif
let g:snips_author = "John Edge"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YouCompleteMe settings
"
" Use either Command or Meta key as a modifier, depending on os
if os == 'Darwin'
    let g:ycm_key_list_select_completion = ['<C-n>', '<D-j>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<D-k>']
else
    let g:ycm_key_list_select_completion = ['<C-n>', '<M-j>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<M-k>']
endif
let g:ycm_autoclose_preview_window_after_completion = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
