local builtin = require('telescope.builtin')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '?', ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>", {})
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<C-f>", ":Telescope file_browser<CR>", { noremap = true }
)
