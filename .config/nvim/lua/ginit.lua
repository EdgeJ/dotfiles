-- Set colorscheme
vim.opt.termguicolors = true
vim.cmd('colorscheme dracula')

-- Set GUI font
vim.opt.guifont = "MesloLGL Nerd Font,Meslo LG L for Powerline:h12"

-- Remove pipe chars from vertical borders
vim.opt.fillchars:append({ vert = ' ' })

-- Neovide settings
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0 -- disable cursor animation

-- Start nvim-tree when Vim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require('nvim-tree.api').tree.open()
    if vim.fn.argc() > 0 or vim.fn.exists("s:std_in") == 1 then
      vim.cmd('wincmd p')
    end
  end
})

-- Close nvim-tree if it's the only buffer open
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.fn.bufname():match('^NvimTree_' .. vim.fn.tabpagenr() .. '$') then
      vim.cmd('quit')
    end
  end
})

-- Reload files on external changes
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    vim.cmd('checktime')
  end
})

-- Terminal settings
local terminal_group = vim.api.nvim_create_augroup("neovim_terminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = terminal_group,
  callback = function()
    vim.cmd('startinsert')
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = terminal_group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = terminal_group,
  callback = function()
    vim.keymap.set('n', '<C-c>', 'i<C-c>', { buffer = true })
  end
})

-- Terminal keymap
vim.keymap.set('n', '<F7>', ':botright new<CR><ESC>:terminal<CR>', { noremap = true })

-- Keymaps for copy/paste in macOS
vim.keymap.set('v', '<D-c>', '"+y') -- Copy
vim.keymap.set({'n', 'v'}, '<D-v>', '"+P') -- Paste normal and visual mode
vim.keymap.set('i', '<D-v>', '<ESC>lPa') -- Paste insert mode
vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode

-- macOS meta key
vim.keymap.set('n', '<D-t>', ':tabnew<CR>')
vim.keymap.set('n', '<D-n>', ':!neovide<CR><CR>')

-- Keymaps for scaling fonts
vim.g.neovide_scale_factor = 1.0

local function change_scale_factor(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set('n', '<C-=>', function() change_scale_factor(1.25) end)
vim.keymap.set('n', '<C-->', function() change_scale_factor(1/1.25) end)
