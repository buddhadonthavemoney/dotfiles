require('nvim_comment').setup()

vim.keymap.set({"n","v"}, "<C-/>", ":CommentToggle<Enter>")


