local builtin = require('telescope.builtin')

-- help telescope.setup()
require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
    },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
