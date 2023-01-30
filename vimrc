" -------General Settings ----
set ruler
set number
set showcmd
set incsearch
set hlsearch
set mouse=a
set ttymouse=xterm2


"filetype off
"" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif

inoremap jh <Esc>

filetype off
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" making vim look good
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'prabirshrestha/async.vim'
Plugin 'hzchirs/vim-material'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'DrawIt'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'rust-lang/rust.vim'

"Plugin 'mattn/emmet-vim'
call vundle#end()

filetype plugin indent on
set background=dark
colorscheme solarized

set rtp+=/usr/local/opt/fzf
let g:go_bin_path = $HOME."/go/bin"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:airline#extensions#tabline#enabled = 1


" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
set completeopt=menuone,noinsert

au filetype go inoremap <buffer> . .<C-x><C-o>

set tabstop=2
set expandtab
set shiftwidth=4
set runtimepath+=~/.vim-plugins/LanguageClient-neovim
map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
map <C-g> :GoTest<CR>
map gt :GoDefType<CR>
set colorcolumn=100


set clipboard=unnamed
set re=2
