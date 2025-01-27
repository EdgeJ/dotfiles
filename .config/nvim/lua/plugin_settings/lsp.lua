local lspconfig = require('lspconfig')
local schemastore = require('schemastore').yaml.schemas()
-- Add support for gitlab-ci yaml with named configs
schemastore['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = "/.gitlab-ci*.yml"
schemastore['https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.23.0-standalone/pod.json'] = "*.k8s.yaml"

lspconfig.ansiblels.setup{
  filetypes = {
      'yaml.ansible',
  },
}
lspconfig.bashls.setup{}
lspconfig.dockerls.setup{}
lspconfig.golangci_lint_ls.setup{}
lspconfig.gopls.setup{
    on_attach = function(client)
        require('lsp_signature').on_attach() -- Use signature completion
    end,
}
lspconfig.jsonls.setup{}
lspconfig.jsonnet_ls.setup{
    on_attach = function(client)
        require('lsp_signature').on_attach() -- Use signature completion
    end,
}
lspconfig.terraformls.setup{
    on_attach = function(client)
        require('lsp_signature').on_attach() -- Use signature completion
    end,
}
lspconfig.tflint.setup{}
lspconfig.yamlls.setup{
    settings = {
        yaml = {
            schemas = schemastore,
        },
    },
}

-- Show completions even for a single suggestion
vim.o.completeopt = 'menu,menuone'

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Fix for bug in yaml-lint-server returning "&emsp;" instead of spaces
-- https://github.com/redhat-developer/yaml-language-server/pull/844
local function hover_wrapper(err, request, ctx, config)
  local bufnr, winnr = vim.lsp.handlers.hover(err, request, ctx, config)
  if bufnr then
    local contents = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    contents = vim.tbl_map(
      function(line)
        return string.gsub(line, "&emsp;", "")
      end,
      contents
    )
    contents = vim.lsp.util.trim_empty_lines(contents)
    vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)
    vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
    vim.api.nvim_win_set_height(winnr, #contents)
  end
end

vim.lsp.handlers["textDocument/hover"] = hover_wrapper
