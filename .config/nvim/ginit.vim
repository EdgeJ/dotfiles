"set gvim color scheme
set termguicolors
colorscheme dracula
"set gvim font
set guifont=Meslo\ LG\ L\ for\ Powerline:h12

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
