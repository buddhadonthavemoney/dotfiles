
set termguicolors
lua require'colorizer'.setup()
if (has("autocmd") && !has("gui_running"))
    augroup colors
        autocmd!
        let s:background = { "gui": "#1F2023" , "cterm": "235", "cterm16": "0" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background })
    augroup END
endif


let g:onedark_termcolors=256
colorscheme onedark
set guifont=Monaco:h10 
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
