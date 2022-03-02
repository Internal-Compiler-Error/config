set relativenumber
set number

" Makes the UI slightly faster
set lazyredraw

" Allow for mouse everywhere
set mouse=a

" Force myself to not use arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Tabs are evil
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" From https://blog.sher.pl/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader="\<Space>"


syntax enable
filetype plugin indent on

call plug#begin()
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'morhetz/gruvbox'

" File finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Required as dependency

" Source code tree visualizer
Plug 'preservim/nerdtree'

" Language support
" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
"Plug 'rhysd/vim-clang-format'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" async LSP support
Plug 'dense-analysis/ale'

" highlight the yanked region
Plug 'machakann/vim-highlightedyank'

" neovim's builtin LSP server's handy configs
Plug 'neovim/nvim-lspconfig'
call plug#end()

let g:ale_linters = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'rust': ['analyzer'], 
\	'c': ['clang-format', 'clangd', 'clangtidy']}
let g:ale_fixers = {
\	'rust': ['rustfmt'],
\	'c': ['clang-format', 'clangtidy']}

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
nnoremap <Leader>r :ALERename<CR>

set background=dark 
colorscheme gruvbox

nnoremap <Leader>t :NERDTree<CR>
nnoremap <Leader>p :FZF<CR>

" Quickly switch between two files
nnoremap <Leader><Leader> <C-^>

" perhaps in the future, I'm too dumb to figure it out now
" use rust analyzer for for LSP 
" lua require'lspconfig'.rust_analyzer.setup({})

" bufferline set up
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
