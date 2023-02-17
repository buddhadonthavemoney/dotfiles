lua <<eof

local lsp_installer = require("nvim-lsp-installer")

-- register a handler that will be called for all installed servers.
-- alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    -- this setup() function is exactly the same as lspconfig's setup function.
    -- refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    server:setup(opts)
end)
eof
lua << eof
  require("flutter-tools").setup{} -- use defaults
  require("flutter-config")
eof



"lsp features
lua << eof
local saga = require 'lspsaga'
saga.init_lsp_saga()
eof
 " jump to definition
"cursor word definition and reference
nnoremap <silent> gh :Lspsaga lsp_finder<cr>
"
"code action
nnoremap <silent>ca :Lspsaga code_action<cr>
vnoremap <silent>ca :<c-u>lspsaga range_code_action<cr>

"hover
nnoremap <silent>K :Lspsaga hover_doc<cr>

"rename
nnoremap <silent>gr :Lspsaga rename<cr>

"goto or preview defination 
nnoremap <silent> gd :Lspsaga preview_definition<cr>
nnoremap <silent> <leader>gd <cmd> lua vim.lsp.buf.definition()<cr>


"signature help
nnoremap <silent>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>

"diagnostic
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<cr>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<cr>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<cr>

"float terminal
nnoremap <silent> <a-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>  
tnoremap <silent> <a-d> <c-\><c-n>:lua require('lspsaga.floaterm').close_float_terminal()<cr>
