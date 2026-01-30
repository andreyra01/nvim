-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require "nvim-tree.api"

local function my_on_attach(bufnr)
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('File tree help'))
end

local function open_nvim_tree(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    if not real_file then
        return
    end

    -- open the tree, find the file but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = true, find_file = true, })
end

vim.keymap.set('n', '<leader>ft', api.tree.toggle, { desc = '[F]ile [T]ree' })

-- empty setup using defaults
require("nvim-tree").setup({
    on_attach = my_on_attach,
    view = {
        adaptive_size = true,
    },
    update_focused_file = {
        enable = true,
    }
})
