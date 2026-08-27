if vim.g.vscode then
    require("options_vscode")
else
    require("plugins.rust")
    require("plugins")
    require("plugins.treesitter")
    require("plugins.lsp")
    require("plugins.cmp")
    require("plugins.tree")
    require("plugins.go")
    require("plugins.lualine")
    require("plugins.colorscheme")
    require("plugins.dap")
    require("plugins.telescope")
    require("plugins.http")
    require("options")
end
