local ft = require('guard.filetype')

-- Assuming you have guard-collection
local black = {
  cmd = 'black',
  args = { '--line-length','120', '--quiet', '-' },
  stdin = true,
}

ft('python'):fmt(black)

-- Call setup() LAST!
require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
})

vim.keymap.set("n", "<leader>f", ":GuardFmt<CR>", { noremap = true, silent = true })
