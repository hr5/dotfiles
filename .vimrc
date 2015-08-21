set nocompatible
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

Plugin 'kovisoft/slimv'

Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

call vundle#end()

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = 'branch'
let g:airline_symbols.readonly = 'r'
let g:airline_symbols.linenr = 'line'

let &titleold = getcwd()
let mapleader = ','

filetype plugin indent on
syntax on

set t_Co=256              "256 Color
set background=dark
colorscheme gruvbox

set noshowmode
set showtabline=2
set backspace=2           " enable <BS> for everything
set laststatus=2
set number
set cursorline
set cursorcolumn
set hidden                " hide when switching buffers, don't unload
set ttyfast               " increase chars sent to screen for redrawing
set mouse=a               " enable mouse in all modes
set title                 " use filename in window title
set noerrorbells          " no error sound
set showcmd               " show cmd
set ruler                 " show cursor line number
set showmode              " show mode

"Tab
set softtabstop=4
set shiftwidth=4
set expandtab 

" Folding
set foldignore=           " don't ignore anything when folding
set foldlevelstart=99     " no folds closed on open
set foldmethod=marker     " collapse code using markers
set foldnestmax=1         " limit max folds for indent and syntax methods

"Search
set hlsearch              " highlight search results
set incsearch             " search whilst typing
set ignorecase            " case insensitive searching
set smartcase             " override ignorecase if upper case typed

"Completion
set wildmenu              " enhanced cmd line completion
set wildchar=<TAB>TAB      " key for line completion
set completeopt=longest,menuone   " Autocompletion options
set complete=.,w,b,u,t,i,d        " autocomplete options (:help 'complete')

" gVim
if has('gui_running')
    set guioptions-=m               " remove menu
    set guioptions-=T               " remove toolbar
    set guioptions-=r               " remove right scrollbar
    set guioptions-=b               " remove bottom scrollbar
    set guioptions-=L               " remove left scrollbar
    set guicursor+=a:block-blinkon0 " use solid block cursor
endif


map <F12> :NERDTreeToggle<CR> 
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-d> :bdelete<CR>

" Buffer selection
nnoremap <Leader>s :buffers<CR>:buffer<Space>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby   nmap <F5> :call RunWith("ruby")<CR>
autocmd FileType python   nmap <F5> :call RunWith("python")<CR>
