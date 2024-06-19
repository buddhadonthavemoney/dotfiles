local builtin = require('telescope.builtin')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '?', ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>", {})
vim.keymap.set('n', '<C-p>',
	":Telescope find_files find_command=fdfind,--no-ignore-vcs,--hidden prompt_prefix=🔍<CR>",
	{})
vim.keymap.set('n', '<leader>cb', ":Telescope git_branches<CR>", {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set("n", "<C-g>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tc', builtin.commands, {})
vim.keymap.set('n', '<leader>t', ":Telescope<CR>")

require "telescope".setup {
	  pickers = {
		colorscheme = {
		  enable_preview = true
		}
	}
}
