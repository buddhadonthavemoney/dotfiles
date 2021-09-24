set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}    "html code completion"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' "dependency to ranger
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'valloric/MatchTagAlways'
"
"visual
Plug 'osyo-manga/vim-brightest' "highlight the word in the cursor
Plug 'norcalli/nvim-colorizer.lua' "nvim color
Plug 'itchyny/lightline.vim' "lightline
Plug 'preservim/nerdtree' "nerdtree
Plug 'mhinz/vim-startify' "startpage

"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

""""programming
Plug 'trishume/syntect' "Rust
Plug 'mattn/emmet-vim' 


""""LSP
Plug 'neovim/nvim-lspconfig' "LSP
Plug 'glepnir/lspsaga.nvim' "LSP features UI
Plug 'kabouzeid/nvim-lspinstall' "LSP install
Plug 'nvim-lua/completion-nvim' "autocompletion
"Plug 'nvim-treesitter/nvim-treesitter', 
"Plug 'nvim-treesitter/nvim-treesitter-textobjects'

""""flutter tools
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-lua/plenary.nvim' "dependency of flutter-tools

"Plug 'natebosch/vim-lsc' 
"Plug 'natebosch/vim-lsc-dart'

""""colorschemes"
Plug 'pgavlin/pulumi.vim'
Plug 'dylanaraps/wal.vim'
Plug 'ulwlu/elly.vim'
Plug 'pineapplegiant/spaceduck'
Plug 'jdsimcoe/abstract.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rainglow/vim'
Plug 'dbb/vim-gummybears-colorscheme'
Plug 'joshdick/onedark.vim'
Plug 'zefei/simple-dark'

call plug#end()

let mapleader = " " 
source /home/buddha/.config/nvim/plugconfigs/fzf.vim
source /home/buddha/.config/nvim/plugconfigs/colors.vim
source /home/buddha/.config/nvim/plugconfigs/startify.vim
source /home/buddha/.config/nvim/plugconfigs/lsp.vim


"set ignorecase case insensitive search"
syntax on
set splitright
set splitbelow
"set nowrap
set guifont=Candas:h17
set noswapfile
set incsearch  "highlight as you search"
set inccommand=nosplit
set mouse=a
set number    "helps set hybrid number"
set relativenumber
set colorcolumn=80

"set foldcolumn=3
"setlocal colorcolumn=80
filetype plugin indent on " show existing tab with 4 spaces width
set tabstop=4 softtabstop=4 " when indenting with '>', use 4 spaces width
set smartindent
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab "in insert mode change tab to spaces

set noshowmode "for lightline disabling show mode"
set laststatus=2 
set timeout timeoutlen=400 "time to wait between keystrokes"
set ttimeoutlen=50 "time out to wait for key code sequence to complete
set hlsearch "highlight search
set hidden  "hide buffer instead of prompting to save
set shortmess-=F  "for suppressing error messages by lsp


"Go to the matching tag html
nnoremap <leader>% :MtaJumpToOtherTag<CR> 
vnoremap <leader>% :MtaJumpToOtherTag<CR> 

"ctrl+backspace 
"this is for vim gui
noremap! <C-BS> <C-w> 
noremap! <C-h> <C-w>


"copy to end of line
noremap Y y$

"copy to clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

"nerd commenter and tree
map <C-_> <leader>c<leader>
map <C-t> :NERDTreeToggle<CR>

"resize splits
noremap <leader>= :vertical resize +5<CR>
noremap <leader>- :vertical resize -5<CR>
noremap <leader>j :resize +2<CR>
noremap <leader>k :resize -2<CR>

noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>

"change directory 
cnoremap <C-d> :cd %:p:h<CR>

"open and source vim config
cnoremap sv source ~/.config/nvim/init.vim<CR>
cnoremap vc e ~/.config/nvim/init.vim<CR>

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

"moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==



