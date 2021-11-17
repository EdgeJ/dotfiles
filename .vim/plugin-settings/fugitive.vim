" function to toggle git status with a window height of 20 lines
function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    Git
    20wincmd_
  endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

augroup fugitive_au
  autocmd!
  autocmd FileType fugitive setlocal winfixheight
augroup END

"map <F6> to toggle git buffer
map <F6> :ToggleGStatus<CR>

"close vim if git is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:fugitive") && b:fugitive.isTabTree()) | q | endif
