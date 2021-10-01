lua <<EOF
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
  require'lspconfig'[server].setup{on_attach=require'completion'.on_attach}

end
EOF

autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
" dart 
lua << EOF
  require("flutter-tools").setup{} -- use defaults
  require("flutter-config")
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

"lsp features
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
 " Jump to definition
"cursor word definition and reference
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
"
"code action
nnoremap <silent>ca :Lspsaga code_action<CR>
vnoremap <silent>ca :<C-U>Lspsaga range_code_action<CR>

"hover
nnoremap <silent>K :Lspsaga hover_doc<CR>

"rename
nnoremap <silent>gr :Lspsaga rename<CR>

"goto or preview defination 
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>gd <cmd> lua vim.lsp.buf.definition()<CR>


"signature help
nnoremap <silent>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

"diagnostic
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

"float terminal
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>  
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
