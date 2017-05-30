set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"general settings"
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

"linter settings"
let g:syntastic_eruby_checkers = ['ruby']
let g:syntastic_puppet_checkers = ['puppetlint']
let g:syntastic_puppet_puppetlint_args = 
    \ "--no-80chars-check --no-140chars-check --no-arrow_alignment-check"
let g:syntastic_puppet_puppetlint_sort = 1
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_flake8_args = '--ignore=F403,F405'
let g:syntastic_ruby_checkers = ['rubylint']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_sh_shellcheck_args = "--exclude=SC2086"

highlight SyntasticError guibg=#2f0000
