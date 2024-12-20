function set_tabwidth_for_filetypes(filetypes, tabwidth)
    for _, filetype in ipairs(filetypes) do
        vim.cmd(string.format('au FileType %s set tabstop=%s shiftwidth=%s softtabstop=%s', filetype, tabwidth, tabwidth, tabwidth))
    end
end

Plug = vim.fn['plug#']
