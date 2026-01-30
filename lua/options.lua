vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.g.cmp_disabled = true

vim.keymap.set('n', '<Tab>', function() vim.cmd('bn') end, { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<S-Tab>', function() vim.cmd('bn') end, { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>bd', function() vim.cmd('bd') end, { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>ba', function() vim.cmd('bufdo bd') end, { desc = '[B]uffer Delete [A]ll' })
-- vim.keymap.set('n', '<C-h>', function() vim.cmd(':norm <C-W>h<CR>') end, { desc = 'Change window left' })
vim.cmd(":nnoremap <C-H> <C-W>h")
vim.cmd(":nnoremap <C-L> <C-W>l")
vim.cmd(":nnoremap <C-J> <C-W>j")
vim.cmd(":nnoremap <C-K> <C-W>k")
