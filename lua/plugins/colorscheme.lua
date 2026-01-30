require 'evergarden'.setup {
    theme = {
        variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'pink',
    },
    editor = {
        transparent_background = false,
        override_terminal = true,
        sign = { color = 'none' },
        float = {
            color = 'mantle',
            solid_border = false,
        },
        completion = {
            color = 'surface0',
        },
    },
    style = {
        tabline = { 'reverse' },
        search = { 'italic', 'reverse' },
        incsearch = { 'italic', 'reverse' },
        types = { 'italic' },
        keyword = { 'italic' },
        comment = { 'italic' },
    },
    overrides = {},
    color_overrides = {},
    {
        integrations = {
            blink_cmp = true,
            cmp = true,
            fzf_lua = true,
            gitsigns = true,
            indent_blankline = { enable = true, scope_color = 'green' },
            mini = {
                enable = true,
                animate = true,
                clue = true,
                completion = true,
                cursorword = true,
                deps = true,
                diff = true,
                files = true,
                hipatterns = true,
                icons = true,
                indentscope = true,
                jump = true,
                jump2d = true,
                map = true,
                notify = true,
                operators = true,
                pick = true,
                starters = true,
                statusline = true,
                surround = true,
                tabline = true,
                test = true,
                trailspace = true,
            },
            nvimtree = true,
            rainbow_delimiters = true,
            symbols_outline = true,
            telescope = true,
            which_key = true,
            neotree = true,
        },
    }
}


-- vim.cmd 'colorscheme evergarden'

-- vim.cmd 'colorscheme dawnfox'
--
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Enable italic inlay type hints
    italic_inlayhints = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Apply theme colors to terminal
    terminal_colors = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    }
})

require('vscode').load()

-- load the theme without affecting devicon colors.
vim.cmd.colorscheme "vscode"
