call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" Rust
Plug 'simrat39/rust-tools.nvim'
Plug 'alx741/vim-rustfmt'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Telescope and dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'

Plug 'vim-airline/vim-airline' " status bar
Plug 'norcalli/nvim-colorizer.lua' " hex, rgb colorizer
Plug 'kyazdani42/nvim-web-devicons'

" Ctrl P
Plug 'kien/ctrlp.vim'

" Jump to Definition
Plug 'ludovicchabant/vim-gutentags'

" Color schemas
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'andweeb/presence.nvim'

call plug#end()
" Base settings
set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menu,menuone,noselect
set mousehide
set mouse=a
set cmdheight=1
set signcolumn=yes
set updatetime=50
set colorcolumn=120
set clipboard=unnamedplus
set shortmess+=c
set termguicolors

let mapleader = " "

" Colorscheme
colorscheme onedark
let g:airline_theme='onedark'
highlight Normal guibg=none
highlight signcolumn guibg=none

" Import lua configs
lua require("lsp")
lua require("plug-colorizer")
lua require("plug-gitsigns")
lua require("plug-presence")
lua require("plug-rust-tools")

" Go LSP settings (https://github.com/golang/tools/blob/master/gopls/doc/vim.md)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

" Go to Definition
nnoremap gd <C-]>

" Esc Alternative
inoremap jk <Esc>

" Cargo
nnoremap <leader>r :!cargo run<CR>
nnoremap <leader>t :!cargo test<CR>
nnoremap <leader>c :!cargo check<CR>

" Disable arrows
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Trim whitespace on file save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup YSOMAD
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
