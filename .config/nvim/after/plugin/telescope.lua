local builtin = require('telescope.builtin')
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local lga_shortcuts = require("telescope-live-grep-args.shortcuts")

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
vim.keymap.set({ 'n', 'v' }, '<leader>s',
	function()
		lga_shortcuts.grep_word_under_cursor({ postfix = "", quote = false })
	end,
	{}
)

require "telescope".setup {
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					-- freeze the current list and start a fuzzy search in the frozen list
					["<C-space>"] = lga_actions.to_fuzzy_refine,
				},
			},
			-- ... also accepts theme settings, for example:
			-- theme = "dropdown", -- use dropdown theme
			-- theme = { }, -- use own theme spec
			-- layout_config = { mirror=true }, -- mirror preview pane
		}
	}
}
telescope.load_extension("live_grep_args")
