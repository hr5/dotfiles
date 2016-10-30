set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'optroot/auto-pairs'

"Languages
Plugin 'klen/python-mode'
Plugin 'rust-lang/rust.vim'
Plugin 'zah/nim.vim'
Plugin 'dagwieers/asciidoc-vim'
Plugin 'udalov/kotlin-vim'

"Colorscheme
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
Plugin 'mkarmona/colorsbox'

call vundle#end()

"Airline
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = 'branch'
let g:airline_symbols.readonly = 'r'
let g:airline_symbols.linenr = 'line'

"AutoPairs
let g:AutoPairsOnlyAtEOL = 1

"pymode
let g:pymode_lint = 0
let g:pymode_rope_completion = 0

"Slimv
let g:slimv_leader = '\'
let g:paredit_leader = '\'
let g:paredit_electric_return = 0

let &titleold = getcwd()
let mapleader = ','
let maplocalleader = '\'

filetype plugin indent on
syntax on

set t_Co=256              "256 Color
set background=dark
colorscheme colorsbox-stnight

set noshowmode
set showtabline=2
set backspace=2           " enable <BS> for everything
set laststatus=2
set number
set cursorline
set hidden                " hide when switching buffers, don't unload
set ttyfast               " increase chars sent to screen for redrawing
set mouse=a               " enable mouse in all modes
set title                 " use filename in window title
set noerrorbells          " no error sound
set showcmd               " show cmd
set ruler                 " show cursor line number
set showmode              " show mode
set lazyredraw            " Don't redraw while executing macros (good performance config)
set autoindent
set smartindent
set cindent
set colorcolumn=80

"Tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
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
    set guiheadroom=0
endif

nnoremap <C-b> <C-^>
nnoremap <C-d> :bdelete<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-j> :tp<CR>
nnoremap <C-k> :tn<CR>

nnoremap <Leader>g :GundoToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :Autoformat<CR>

au BufEnter *.hs set expandtab
