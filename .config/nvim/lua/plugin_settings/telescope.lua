-- Set shortcut keys for searching with Telescope
vim.keymap.set({'n', 'v'}, '<F3>', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<F4>', ':Telescope live_grep<CR>')
