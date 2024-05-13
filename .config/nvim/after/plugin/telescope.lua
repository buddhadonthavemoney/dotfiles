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

-- -- Built-in actions
-- local actions = require('telescope.actions')
-- local transform_mod = require('telescope.actions.mt').transform_mod
-- local action_state = require "telescope.actions.state"
--
-- -- Custom actions
-- local my_delete_buffer_custom = transform_mod({
--     x = function(prompt_bufnr)
--         local current_picker = action_state.get_current_picker(prompt_bufnr)
--         local multi_selection = current_picker:get_multi_selection()
--         actions.close(prompt_bufnr)
--
--         if vim.tbl_isempty(multi_selection) then
--             local selection = action_state.get_selected_entry()
--             vim.api.nvim_buf_delete(selection.bufnr, { force = true })
--         else
--             for _, selection in ipairs(multi_selection) do
--                 vim.api.nvim_buf_delete(selection.bufnr, { force = true })
--             end
--         end
--     end,
-- })
--
-- -- assign mapping to the above action
-- require('telescope').setup {
--     defaults = {
--         mappings = {
--             i = {
--                 ["<leader><M-w>"] = my_delete_buffer_custom.x,
--             },
--             n = {
--                 ["<leader><M-w>"] = my_delete_buffer_custom.x,
--             }
--         }
--     }
-- }
