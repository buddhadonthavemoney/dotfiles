-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
local nvim_tree = require("nvim-tree")
nvim_tree.setup()

-- OR setup with some options
nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
        -- dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { 'node_modules', '__pycache__' },
    },
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", { silent = true })

nvim_tree.setup({
    filters = {
    },
(...)
})
