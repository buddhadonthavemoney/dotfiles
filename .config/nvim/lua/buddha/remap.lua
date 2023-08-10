vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<leader>y", "\"+y")          -- copy to global clipboard
vim.keymap.set("n", "<leader>y", "\"+y")          -- copy to global clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p") -- paste from global clipboard

vim.keymap.set("n", "bn", ":bn<CR>")              -- buffernext
vim.keymap.set("n", "bp", ":bp<CR>")              -- bufferprevious

vim.keymap.set("n", "cd", ":cd %:p:h<CR>")

vim.keymap.set("n", "J", "mzJ`z") -- add the below lines to the same line but remain in the same position
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<leader>d", "\"_d")   -- deleting to void register
vim.keymap.set("n", "<leader>dd", "\"_dd") -- deleting to void register

vim.keymap.set("i", "<C-BS>", "<C-W>")

vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")

vim.keymap.set("n", "<leader>sv", ":source /home/buddha/.config/nvim/init.lua<CR>")
