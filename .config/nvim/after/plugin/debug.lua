require "dap-python".setup("python")
require("nvim-dap-virtual-text").setup({ commented = true })

vim.keymap.set("c", "<F5>", "<ESC>:lua require'dap-python'.setup('python')<CR>", { silent = true })
vim.keymap.set("n", "<C-u>", ":lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":lua require'dap'.step_into()<CR>", { silent = true })
-- vim.keymap.set("n", "<C-p>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ silent = true })
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ))<CR>",
	{ silent = true })
vim.keymap.set("n", "<C-Space>", ":lua require'dapui'.toggle()<CR>", { silent = true })
vim.keymap.set("n", "<Space><Space>", ":lua require('dap-python').test_method()<CR>", { silent = true })

vim.keymap.set({ 'n', 'v' }, '<Leader>k', function()
	require('dap.ui.widgets').hover()
end)
-- vim.keymap.set({ 'n', 'v' }, '<Leader>k', function()
-- 	require('dap.ui.widgets').preview()
-- end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>s', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)

local dap = require("dap")
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Django",
		program = "${workspaceFolder}/manage.py",
		console = "integratedTerminal",
		args = { "runserver", "0.0.0.0:20002" },
		django = true,
		justMyCode = true,
	},
	{
		type = "python",
		request = "launch",
		name = "Django: test",
		program = "${workspaceFolder}/manage.py",
		console = "integratedTerminal",
		args = { "test" },
		justMyCode = true,
	},
	{
		type = "python",
		request = "launch",
		name = "Django: test(specific)",
		program = "${workspaceFolder}/manage.py",
		console = "integratedTerminal",
		args = { "test", "-k", "ListingAPITestCase" },
		justMyCode = true,
	},
	{
		type = "python",
		request = "launch",
		name = "Django: justNotMyCode",
		program = "${workspaceFolder}/manage.py",
		console = "integratedTerminal",
		args = { "runserver", "0.0.0.0:20002" },
		django = true,
		justMyCode = false,
	},
	{
		type = "python",
		request = "launch",
		name = "Django: notebook",
		program = "${workspaceFolder}/manage.py",
		console = "integratedTerminal",
		args = { "shell_plus", "--notebook" },
		justMyCode = true,
	},
	{
		type = "python",
		request = "launch",
		name = "Python: Current File",
		program = "${file}",
		console = "integratedTerminal",
	},
}

require('dap-go').setup {
	-- Additional dap configurations can be added.
	-- dap_configurations accepts a list of tables where each entry
	-- represents a dap configuration. For more details do:
	-- :help dap-configuration
	dap_configurations = {
		{
			-- Must be "go" or it will be ignored by the plugin
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
	},
	-- delve configurations
	delve = {
		-- the path to the executable dlv which will be used for debugging.
		-- by default, this is the "dlv" executable on your PATH.
		path = "dlv",
		-- time to wait for delve to initialize the debug session.
		-- default to 20 seconds
		initialize_timeout_sec = 20,
		-- a string that defines the port to start delve debugger.
		-- default to string "${port}" which instructs nvim-dap
		-- to start the process in a random available port
		port = "${port}",
		-- additional args to pass to dlv
		args = {},
		-- the build flags that are passed to delve.
		-- defaults to empty string, but can be used to provide flags
		-- such as "-tags=unit" to make sure the test suite is
		-- compiled during debugging, for example.
		-- passing build flags using args is ineffective, as those are
		-- ignored by delve in dap mode.
		build_flags = "",
	},
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-float",
	callback = function()
		vim.keymap.set('n', 'q', '<cmd>close!<CR>', { buffer = true, silent = true })
	end,
})
