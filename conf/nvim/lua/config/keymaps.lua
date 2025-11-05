-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local dap = require("dap")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true, silent = true, desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.continue, { noremap = true, silent = true, desc = "Continue" })
vim.keymap.set("n", "<leader>dj", dap.step_over, { noremap = true, silent = true, desc = "Step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, silent = true, desc = "Step into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { noremap = true, silent = true, desc = "Step out" })
vim.keymap.set("n", "<leader>du", require("dapui").toggle, { noremap = true, silent = true, desc = "Open ui" })
