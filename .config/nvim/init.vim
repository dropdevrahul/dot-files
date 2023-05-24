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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'fannheyward/telescope-coc.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set tabstop=2
set expandtab
set shiftwidth=4
filetype plugin indent on
syntax on
set number
set relativenumber
colorscheme catppuccin-mocha

let g:go_fmt_autosave = 1

let mapleader =" "

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>h :ALEHover<CR>
nnoremap <leader>e <cmd>Telescope find_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>Telescope live_grep<CR>
nnoremap <leader>p <cmd>Telescope commands<CR>
nnoremap <leader>d <cmd>Telescope coc diagnostics<CR>
nnoremap <leader>gl <cmd>Telescope git_commits<CR>
nnoremap <leader>gc <cmd>Telescope git_bcommits<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>
nnoremap gd <cmd>Telescope coc definitions<CR>
nnoremap gt <cmd>Telescope coc type_definitions<CR>
nnoremap gi <cmd>Telescope coc implementations<CR>
nnoremap gr <cmd>Telescope coc references<CR>
nnoremap <Leader>tt :FloatermNew --wintype=split --height=0.25 <CR><C-\><C-n>
nnoremap <Leader>w :FloatermNext <CR><C-\><C-n>
nnoremap <Leader>h :FloatermHide <CR><C-\><C-n>
nnoremap <Leader>r :FloatermShow <CR><C-\><C-n>
tnoremap <Esc><Esc> <C-\><c-n>
map <tab> :bnext<cr>
map <S-tab> :bprevious<cr>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>g :TestVisit<CR>

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
pickers = {
    find_files = {
        hidden = true
    }
    }
}
require'telescope'.load_extension('coc')
EOF
