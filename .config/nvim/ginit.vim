"set gvim color scheme
set termguicolors
colorscheme dracula
"set gvim font
set guifont=Meslo\ LG\ L\ for\ Powerline:h12

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
lua vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
lua vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
lua vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
lua vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

"allow clipboard copy paste in neovim
lua vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
lua vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
lua vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
lua vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

"macOS meta key
lua vim.keymap.set('n', '<D-t>', ':tabnew<CR>')
lua vim.keymap.set('n', '<D-n>', ':!neovide<CR><CR>')
