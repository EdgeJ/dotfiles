require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash", "c", "comment", "go", "jsonnet", "lua",
        "python", "query", "terraform", "vim", "vimdoc",
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
