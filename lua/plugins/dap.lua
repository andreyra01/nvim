local dap, dapui = require("dap"), require("dapui")

require("dapui").setup()
local dapgo = require("dap-go")

dapgo.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
--dap.listeners.before.event_terminated.dapui_config = function()
--    dapui.close()
--end
--dap.listeners.before.event_exited.dapui_config = function()
--    dapui.close()
--end

vim.keymap.set("n", "<Leader>dt", ":DapUiToggle<CR>", { desc = "[D]ebug [T]oggle" })
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "[D]ebug Step [O]ver" })
vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "[D]ebug Step [I]nto" })
vim.keymap.set("n", "<Leader>ds", ":DapTerminate<CR>", { desc = "[D]ebug [S]top" })
vim.keymap.set("n", "<Leader>dr", ":DapClearBreakpoints<CR>", { desc = "[D]ebug Clea[R] Breakpoints" })
-- vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", {})

vim.keymap.set("n", "<leader>gd", dapgo.debug_test, { desc = "[G]o [D]ebug Test" })

vim.fn.sign_define("DapBreakpoint",
    { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
