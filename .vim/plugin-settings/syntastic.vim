set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"general settings"
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
" we use balloons for other stuff
let g:syntastic_enable_balloons = 0

"linter settings"
let g:syntastic_ansible_checkers = ['ansible_lint']
let g:syntastic_eruby_checkers = ['ruby']
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_perl_checkers = ['perlcritic']
let g:syntastic_perl_perlcritic_exec = '$HOME/perl5/perlbrew/perls/perl-5.18.0/bin/perlcritic'
let g:syntastic_puppet_checkers = ['puppetlint']
let g:syntastic_puppet_puppetlint_args = 
    \ "--no-80chars-check --no-140chars-check --no-arrow_alignment-check"
let g:syntastic_puppet_puppetlint_sort = 1
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_flake8_args = '--ignore=F403,F405'
let g:syntastic_ruby_checkers = ['rubocop']
if g:os == 'Linux'
    let g:syntastic_ruby_rubocop_exec = '$HOME/.vim/wrappers/rubocop.sh'
endif
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_sh_shellcheck_args = "--exclude=SC2086"
let g:syntastic_yaml_checkers = ['yamllint']

highlight SyntasticError guibg=#2f0000
