" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'voldikss/vim-floaterm'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vim-test/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'rust-lang/rust.vim'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'tpope/vim-fugitive'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set tabstop=2
set expandtab
set shiftwidth=2
filetype plugin indent on
syntax on
set number
set relativenumber
colorscheme catppuccin-mocha

let g:go_fmt_autosave = 1
let g:rustfmt_autosave = 1

let mapleader =" "

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>h :ALEHover<CR>
nnoremap <leader>e <cmd>Telescope find_files theme=ivy<CR>
nnoremap <leader>b <cmd>Telescope buffers theme=ivy<CR>
nnoremap <leader>f <cmd>Telescope live_grep theme=ivy<CR>
nnoremap <leader>p <cmd>Telescope commands theme=ivy<CR>
nnoremap <leader>d <cmd>Telescope coc diagnostics theme=ivy<CR>
nnoremap <leader>gl <cmd>Telescope git_commits theme=ivy<CR>
nnoremap <leader>gc <cmd>Telescope git_bcommits theme=ivy<CR>
nnoremap <leader>gb <cmd>Telescope git_branches theme=ivy<CR>
nnoremap gd <cmd>Telescope coc definitions theme=ivy<CR>
nnoremap gt <cmd>Telescope coc type_definitions theme=ivy<CR>
nnoremap gi <cmd>Telescope coc implementations theme=ivy<CR>
nnoremap gr <cmd>Telescope coc references theme=ivy<CR>
nnoremap <Leader>tt :FloatermNew --wintype=split --height=0.25 <CR><C-\><C-n>
nnoremap <Leader>w :FloatermNext <CR><C-\><C-n>
nnoremap <Leader>h :FloatermHide <CR><C-\><C-n>
nnoremap <Leader>r :FloatermShow <CR><C-\><C-n>
tnoremap <Esc><Esc> <C-\><c-n>
map <tab> :bnext<cr>
map <S-tab> :bprevious<cr>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>tg :TestVisit<CR>
nmap <silent> <leader>g :Git<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <Leader>q  <C-w>w
nnoremap <Leader><tab>  gt

autocmd BufWritePre,FileWritePre *.go :GoFmt
autocmd BufWritePre,FileWritePre *.go :GoImports
autocmd BufWritePre,FileWritePre *.go :GoImports

let g:ale_set_balloons = 1

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "go", "python"},
  highlight = {
    enable = true
    },
}
require'telescope'.setup{
defaults = { file_ignore_patterns = {"node_modules"} },
pickers = {
  find_files = {
    theme="ivy"
  }
  }
}
require'telescope'.load_extension('coc')
require('mini.cursorword').setup()
require('mini.indentscope').setup()
require('mini.surround').setup()
require('mini.animate').setup()
EOF
