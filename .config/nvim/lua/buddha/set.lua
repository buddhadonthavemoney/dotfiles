vim.g.mapleader = " "
vim.o.swapfile = false

vim.cmd("set noexpandtab")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.o.relativenumber = true
vim.o.number = true

vim.o.hlsearch = true  -- highlight search
vim.o.incsearch = true -- incremental search

vim.o.colorcolumn = "120"

vim.o.splitright = true -- default hsplit to the right
vim.o.splitbelow = true -- default vsplit below

vim.o.timeout = true
vim.o.timeoutlen = 400 -- time to wait inbetween keystrokes
vim.o.ttimeoutlen = 50 -- time out to wait for key code sequence to complete

vim.o.wrap = false     -- text wont wrap

vim.o.scrolloff = 8    -- min number of scroll lines to keep above or below a cursor


vim.g.rooter_patterns = { "manage.py", "Makefile", "*.sln", "build/env.sh", "Dockerfile", "requirements.txt",
	"Cargo.toml", "requirements" }

-- vim.g.mkdp_auto_start = "1"
