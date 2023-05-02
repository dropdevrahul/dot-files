" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'voldikss/vim-floaterm'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

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

nnoremap <Leader>f :FZF %:p:h<CR>
nnoremap <Leader>t :FloatermNew <CR>
nnoremap <Leader>r :FloatermToggle <CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <silent> K :call ShowDocumentation()<CR>
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" " Copy to clipboard
nnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

autocmd BufWritePre,FileWritePre *.go :GoFmt
autocmd BufWritePre,FileWritePre *.go :GoImports

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "go", "python"},
  highlight = {
    enable = true
  },
}
EOF
