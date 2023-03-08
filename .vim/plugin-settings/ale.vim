let g:ale_puppet_puppetlint_options = '--no-autoloader_layout-check --no-double_quoted_strings-check'
let g:ale_python_flake8_options = '--ignore E501'
let g:ale_set_balloons = 0
let g:ale_virtualtext_cursor = 'current'
"go/bin isn't correctly set when running MacVIM
if empty($GOPATH)
    let g:ale_go_golint_executable = $HOME . '/go/bin/golint'
else
    let g:ale_go_golint_executable = $GOPATH . '/bin/golint'
endif
