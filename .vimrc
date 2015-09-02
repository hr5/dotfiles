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
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'kovisoft/slimv'
Plugin 'klen/python-mode'
Plugin 'dagwieers/asciidoc-vim'

" Haskell
Plugin 'raichoo/haskell-vim'

"Colorscheme
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

call vundle#end()

"Airline
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
set lazyredraw            " Don't redraw while executing macros (good performance config)

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
set wildchar=<TAB>TAB     " key for line completion
set completeopt=longest,menuone   " Autocompletion options
set complete=.,w,b,u,t,i,d        " autocomplete options (:help 'complete')
set omnifunc=syntaxcomplete#Complete

" gVim
if has('gui_running')
    set guioptions-=m               " remove menu
    set guioptions-=T               " remove toolbar
    set guioptions-=r               " remove right scrollbar
    set guioptions-=b               " remove bottom scrollbar
    set guioptions-=L               " remove left scrollbar
    set guicursor+=a:block-blinkon0 " use solid block cursor
endif

nnoremap <C-b> <C-^>
nnoremap <C-d> :bdelete<CR>

" Buffer selection
nnoremap <Leader>bs :buffers<CR>:buffer<Space>
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bg :e#<CR>
nnoremap <Leader>B <C-^>

nnoremap <Leader>g :GundoToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby   nmap <Leader>r :call RunWith("ruby")<CR>
autocmd FileType python   nmap <Leader>r :call RunWith("python")<CR>
