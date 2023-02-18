"telescope
lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = "> "
    }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("flutter")
EOF

nnoremap <C-l> <cmd>Telescope find_files <cr>
nnoremap <C-b> <cmd>Telescope buffers <cr>
nnoremap <C-g> <cmd>Telescope live_grep <cr>
nnoremap <leader>fh <cmd>Telescope help_tags <cr>
nnoremap <leader>fd <cmd>Telescope file_browser <cr>
nnoremap ? :Telescope current_buffer_fuzzy_find sorting_strategy=ascending <cr>
cnoremap ts Telescope <CR> 

