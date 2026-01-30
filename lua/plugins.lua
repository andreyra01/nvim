-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "williamboman/mason.nvim"
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            'nvim-treesitter/nvim-treesitter',
        },
        {
            'neovim/nvim-lspconfig',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
        },
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
        {
            'nvim-tree/nvim-tree.lua',
            'nvim-tree/nvim-web-devicons'
        },
        {
            "ray-x/go.nvim",
            dependencies = {
                "ray-x/guihua.lua",
                "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter",
            },
            config = function()
                require("go").setup()
            end,
            event = { "CmdlineEnter" },
            ft = { "go", 'gomod' },
            build =
            ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        },
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons'
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        {
            "kawre/leetcode.nvim",
            build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
            dependencies = {
                "nvim-telescope/telescope.nvim",
                -- "ibhagwan/fzf-lua",
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
            },
            opts = {
                -- configuration goes here
            },
        },
        {
            "Mofiqul/vscode.nvim",
        },
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            keys = {
                {
                    "<leader>?",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            },
        },
        {
            "maxandron/goplements.nvim",
            ft = "go",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },
        {
            "mfussenegger/nvim-dap",
            dependencies = {
                "rcarriga/nvim-dap-ui",
                "leoluz/nvim-dap-go",
                "nvim-neotest/nvim-nio"
            },
        },
        {
            "kdheepak/lazygit.nvim",
            lazy = true,
            cmd = {
                "LazyGit",
                "LazyGitConfig",
                "LazyGitCurrentFile",
                "LazyGitFilter",
                "LazyGitFilterCurrentFile",
            },
            -- optional for floating window border decoration
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            -- setting the keybinding for LazyGit with 'keys' is recommended in
            -- order to load the plugin when the command is run for the first time
            keys = {
                --{ "<leader>gt", "<cmd>LazyGit<cr>", desc = "[G]it [T]oggle" }
            }
        },
        {
            'lewis6991/gitsigns.nvim',
        },
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
            keys = {
                {
                    "<leader>ld",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "[L]SP [D]iagnostics",
                },
                {
                    "<leader>lb",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "[L]SP [B]uffer Diagnostics",
                },
                {
                    "<leader>ls",
                    "<cmd>Trouble symbols toggle focus=false<cr>",
                    desc = "[L]SP [S]ymbols",
                },
            },
        },
        {
            'marko-cerovac/material.nvim',
        },
        {
            'ldelossa/litee.nvim',
            event = "VeryLazy",
            opts = {
                notify = { enabled = false },
                panel = {
                    orientation = "bottom",
                    panel_size = 10,
                },
            },
            config = function(_, opts) require('litee.lib').setup(opts) end
        },

        {
            'ldelossa/litee-calltree.nvim',
            dependencies = 'ldelossa/litee.nvim',
            event = "VeryLazy",
            opts = {
                on_open = "panel",
                map_resize_keys = false,
            },
            config = function(_, opts) require('litee.calltree').setup(opts) end
        },
        {
            "mistweaverco/kulala.nvim",
            keys = {
                { "<leader>hs", desc = "Send request" },
                { "<leader>ha", desc = "Send all requests" },
                { "<leader>hb", desc = "Open scratchpad" },
            },
            ft = { "http", "rest" },
            opts = {
                -- your configuration comes here
                global_keymaps = true,
                global_keymaps_prefix = "<leader>h",
                kulala_keymaps_prefix = "",
            },
        },
        {
            "ruifm/gitlinker.nvim",
        },
        {
            "pmizio/typescript-tools.nvim",
            dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
            opts = {},
        },
        {
            'everviolet/nvim',
            name = 'evergarden',
            priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
            opts = {
                theme = {
                    variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
                    accent = 'green',
                },
                editor = {
                    transparent_background = false,
                    sign = { color = 'none' },
                    float = {
                        color = 'mantle',
                        solid_border = false,
                    },
                    completion = {
                        color = 'surface0',
                    },
                },
            }
        },
        { "EdenEast/nightfox.nvim" },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})


require("mason").setup({})
require('litee.lib').setup({})
require('litee.calltree').setup({})
