require('gitlab').setup({
  statusline = {
    enabled = true
  },
  code_suggestions = {
    auto_filetypes = { 'go', 'python', 'sh', 'terraform' }, -- Default is { 'ruby' }
  },
  ghost_text = {
    enabled = true,
    stream = true
  }
})


-- Toggle Code Suggestions on/off with CTRL-g in normal mode:
vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)')
