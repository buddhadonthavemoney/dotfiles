set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}    "html code completiton"
Plug 'junegunn/fzf'
Plug 'francoiscabrol/ranger.vim'
Plug 'glacambre/firenvim'
Plug 'chrisbra/Colorizer'
"
"programming
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'rust-lang/rust.vim' "rust
Plug 'trishume/syntect'
Plug 'dart-lang/dart-vim-plugin' "dart
Plug 'mattn/emmet-vim'
"Plug 'natebosch/vim-lsc' 
"Plug 'natebosch/vim-lsc-dart'


"colorschemes"
Plug 'pgavlin/pulumi.vim'
Plug 'dylanaraps/wal.vim'
Plug 'ulwlu/elly.vim'
Plug 'pineapplegiant/spaceduck'
Plug 'jdsimcoe/abstract.vim'
Plug 'zefei/simple-dark'

call plug#end()

if &filetype != "dart"
    source /home/buddha/.config/nvim/coc.vim
endif

let mapleader = " " 

colorscheme elly
let g:lightline = {
      \ 'colorscheme': 'elly',
      \ }

"set ignorecase case insensitive search"
syntax on
set noswapfile
set incsearch  "highlight as you search"
set inccommand=nosplit
set mouse=a
set number    "helps set hybrid number"
set relativenumber
set foldcolumn=3
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab  "convert tab to spaces"
set noshowmode "for lightline disabling show mode"
set laststatus=2 
set timeout timeoutlen=400 "time to wait between keystrokes"
set ttimeoutlen=50
set hlsearch

set shortmess-=F  "for suppressing error messages by lsp


" --EMMET CONFIG --
"  redefine trigger key
let g:user_emmet_leader_key=','
"key mappings"
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Cc :ColorToggle<CR>
map <C-_> <S-i>#<Esc>
map <C-l> :<C-u>FZF<CR>
map <C-n> :NERDTreeToggle<CR>
inoremap {<Space> {}<C-o>i<CR><C-o><S-o>

set termguicolors
