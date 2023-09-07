"set gvim color scheme
set termguicolors
colorscheme dracula
"set gvim font
set guifont=Meslo\ LG\ L\ for\ Powerline:h12

"remove pipe chars from vertical borders
set fillchars+=vert:\ 

let g:neovide_hide_mouse_when_typing = v:true
let g:neovide_remember_window_size = v:true
let g:neovide_cursor_animation_length = 0 "disable cursor animation"

"start nvim-tree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NvimTreeOpen | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"close nvim-tree if its the only buffer open
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

"workaround for files not reloading on external changes
"can be removed once https://github.com/neovide/neovide/issues/1477 is done
autocmd FocusGained * checktime

"keymaps for copy/paste in macOS
lua vim.keymap.set('v', '<D-c>', '"+y') -- Copy
lua vim.keymap.set({'n', 'v'}, '<D-v>', '"+P') -- Paste normal and visual mode
lua vim.keymap.set('i', '<D-v>', '<ESC>gPa') -- Paste insert mode
lua vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode

"macOS meta key
lua vim.keymap.set('n', '<D-t>', ':tabnew<CR>')
lua vim.keymap.set('n', '<D-n>', ':!neovide<CR><CR>')

"keymaps for scaling fonts
let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
  let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.25)
nnoremap <expr><C--> ChangeScaleFactor(1/1.25)
