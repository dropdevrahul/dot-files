set nocompatible

" -------General Settings ----
set ruler
set number
set showcmd
set incsearch
set hlsearch

"filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" making vim look good
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'davidhalter/jedi-vim'
"Plugin 'mattn/emmet-vim'
call vundle#end()

filetype plugin indent on
set background=dark
colorscheme default
set laststatus=2
hi clear SignColumn
let g:airline_detect_paste=1
let g:airline#extension#tabline#enabled = 1
let g:jedi#show_call_signatures = "1"

set tabstop=4
set expandtab
set shiftwidth=4
map <C-n> :NERDTreeToggle<CR>
