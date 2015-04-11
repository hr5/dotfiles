set nocompatible
set noshowmode
set t_Co=256
set showtabline=2
set laststatus=2
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'klen/python-mode'

Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

call vundle#end()

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set background=dark
colorscheme gruvbox

set hlsearch
set number
set cursorline
set cursorcolumn
set softtabstop=4
set shiftwidth=4
set expandtab 
filetype plugin indent on
syntax on

map <F12> :NERDTreeToggle<CR> 
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-d> :bdelete<CR>

function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby   nmap <F5> :call RunWith("ruby")<CR>
autocmd FileType python   nmap <F5> :call RunWith("python")<CR>
