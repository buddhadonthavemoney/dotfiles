set runtimepath^=~/.vim 
let &packpath = &runtimepath


call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}    "html code completion"
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' "dependency to ranger
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'valloric/MatchTagAlways'
Plug 'nvim-lua/plenary.nvim' "dependency of flutter-tools and telescope
Plug 'nvim-telescope/telescope.nvim' 
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
"
"visual
Plug 'osyo-manga/vim-brightest' "highlight the word in the cursor
Plug 'norcalli/nvim-colorizer.lua' "nvim color
"Plug 'itchyny/lightline.vim' "lightline
Plug 'williamboman/nvim-lsp-installer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' "nerdtree
Plug 'mhinz/vim-startify' "startpage
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

""""programming
Plug 'trishume/syntect' "Rust
Plug 'mattn/emmet-vim' 
Plug 'dart-lang/dart-vim-plugin' "dart syntax highlight


""""LSP
Plug 'neovim/nvim-lspconfig' "LSP
"Plug 'glepnir/lspsaga.nvim' "LSP features UI
Plug 'tami5/lspsaga.nvim' 

"Completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"flutter tools
Plug 'akinsho/flutter-tools.nvim'
Plug 'hankchiutw/flutter-reload.vim'

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
"source /home/buddha/.config/nvim/plugconfigs/fzf.vim
source /home/buddha/.config/nvim/plugconfigs/colors.vim
source /home/buddha/.config/nvim/plugconfigs/startify.vim
source /home/buddha/.config/nvim/plugconfigs/lsp.vim
source /home/buddha/.config/nvim/plugconfigs/completion.vim
source /home/buddha/.config/nvim/plugconfigs/telescope.vim


"set ignorecase case insensitive search"
filetype plugin indent on
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
filetype plugin indent on " show existing tab with 2 spaces width
set tabstop=2 softtabstop=2 " when indenting with '>', use 2 spaces width
set autoindent
set smartindent
set shiftwidth=2 " On pressing tab, insert 2 spaces
set expandtab "in insert mode change tab to spaces

set noshowmode "for lightline disabling show mode"
set laststatus=4 
set timeout timeoutlen=400 "time to wait between keystrokes"
set ttimeoutlen=50 "time out to wait for key code sequence to complete
set hlsearch "highlight search
set hidden  "hide buffer instead of prompting to save
set shortmess-=F  "for suppressing error messages by lsp

let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#parser = 'babylon'
let g:coq_settings = { 'auto_start': 'shut-up' }

ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

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
map <C-/> <leader>c<leader>
map <C-t> :NERDTreeToggle<CR>

"resize splits
noremap <leader>= :vertical resize +5<CR>
noremap <leader>- :vertical resize -5<CR>
noremap <leader>j :resize +2<CR>
noremap <leader>k :resize -2<CR>

noremap bn :bn<CR>
noremap bp :bp<CR>

"change directory 
nnoremap cd :cd %:p:h<CR>

"open and source vim config
cnoremap sv source ~/.config/nvim/init.vim<CR>
cnoremap vc e ~/.config/nvim/init.vim<CR>
" markdown compile to pdf and open

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

"moving text
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'


