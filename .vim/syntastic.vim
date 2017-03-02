set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_puppet_checkers = ['puppetlint']
let g:syntastic_puppet_puppetlint_args = 
    \ "--no-80chars-check --no-arrow_alignment-check --no-selector_inside_resource-check"
let g:syntastic_puppet_puppetlint_sort = 1
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_flake8_args = '--ignore=F403,F405'

highlight SyntasticError guibg=#2f0000
