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
"visual
Plug 'osyo-manga/vim-brightest'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

"programming
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'trishume/syntect'
Plug 'dart-lang/dart-vim-plugin' "dart
Plug 'mattn/emmet-vim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'hrsh7th/nvim-compe'
"Plug 'nvim-treesitter/nvim-treesitter', 
"Plug 'nvim-treesitter/nvim-treesitter-textobjects'


"Plug 'natebosch/vim-lsc' 
"Plug 'natebosch/vim-lsc-dart'

"colorschemes"
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
if &filetype != "dart"
    source /home/buddha/.config/nvim/plugconfigs/coc.vim
endif
"source /home/buddha/.config/nvim/plugconfigs/pylint.vim
source /home/buddha/.config/nvim/plugconfigs/fzf.vim
source /home/buddha/.config/nvim/plugconfigs/colors.vim


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


let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'b': '~/.config/bspwm/bspwmrc' },
            \ { 'p': '~/.config/polybar/config' },
            \ { 's': '~/.config/sxhkd/sxhkdrc' },
            \ { 'k': '~/.config/kitty/kitty.conf' },
            \ { 'dj': '~/Code/project/odyssey/odyssey_django/' },
            \ '~/Code',
            \ '/opt/miscellaneous',
            \ ]
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'

let s:footer = [
      \ '                      / /    ___ | |_ ( ) ___  | |_ | |__  (_) _ __  | | __  ',
      \ '                     / /    / _ \| __||/ / __| | __|| |_ \ | || |_ \ | |/ /  ',
      \ '                    / /___ |  __/| |_    \__ \ | |_ | | | || || | | ||   <   ',
      \ '                    \____/  \___| \__|   |___/  \__||_| |_||_||_| |_||_|\_\  ',
      \ '                                                                             ',
      \ '',
      \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_footer = s:center(s:footer)

let g:user_emmet_leader_key=','


"key mappings"
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
noremap <leader>y "+y
noremap <leader>p "+p
cnoremap cc CocCommand<CR>
noremap <leader>tt :call CocAction('runCommand', 'terminal.Toggle')<CR> 
map <C-_> <leader>c<leader>
"map <C-l> :<C-u>FZF<CR>
map <C-t> :NERDTreeToggle<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

noremap <leader>= :vertical resize +5<CR>
noremap <leader>- :vertical resize -5<CR>
noremap <C-j> :resize +2<CR>
noremap <C-k> :resize -2<CR>

noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>
cnoremap <C-d> :cd %:p:h<CR>
cnoremap sv source ~/.config/nvim/init.vim<CR>
cnoremap vc e ~/.config/nvim/init.vim<CR>

