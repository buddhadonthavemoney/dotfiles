if vim.g.vscode then
    -- require("buddha.remap")
else
    -- ordinary Neovim
    require("buddha")
    require("buddha.plugins")
end
