local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimports()
    end,
    group = format_sync_grp,
})

vim.keymap.set("n", "<Leader>gt", ":GoTestFile<CR>", { desc = "[G]o [T]est File" })
vim.keymap.set("n", "<Leader>gs", ":GoFillStruct<CR>", { desc = "[G]o [F]ill Struct" })
vim.keymap.set("n", "<Leader>gr", ":GoRename", { desc = "[G]o [R]ename" })
