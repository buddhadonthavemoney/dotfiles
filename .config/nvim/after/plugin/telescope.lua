local builtin = require('telescope.builtin')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<C-S-s>', ":Telescope lsp_dynamic_workspace_symbols<CR>", { silent = true })
vim.keymap.set('n', '<C-S-o>', ":Telescope lsp_document_symbols<CR>", { silent = true })
vim.keymap.set('n', '?', ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>", { silent = true })
vim.keymap.set('n', '<C-p>',
	":Telescope find_files find_command=fdfind,--no-ignore-vcs,--hidden prompt_prefix=🔍<CR>",
	{ silent = true })
vim.keymap.set('n', '<leader>cb', ":Telescope git_branches<CR>", { silent = true })
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set("n", "<C-g>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tc', builtin.commands, {})
vim.keymap.set('n', '<leader>t', ":Telescope<CR>", { silent = true })

require "telescope".setup {
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	}
}
