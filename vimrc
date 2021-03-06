set nocompatible

" Syntax -------------------------------------------------------------
set t_Co=256
set encoding=utf-8
set background=dark
syntax on

" Directories -------------------------------------------------------------
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Basics -------------------------------------------------------------
set autoindent " Copying autoindent
set backspace=indent,eol,start
set diffopt=filler
set diffopt+=iwhite
set esckeys
set hidden
set history=1000 " Increase history from 20 default to 1000
set mouse=a " Enable mouse
set nowrap
set nu " Enable line numbers
set title
set noshowmode
set visualbell
set wildmenu

" Tabs
set smarttab
set softtabstop=2

" Tab options
set expandtab
set tabstop=2
set shiftwidth=2

" Invisible charater
" set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
" set list

" Numbers
set numberwidth=3
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Other useful config
set ruler
set laststatus=2
set showmatch

" Quick shortcut
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓
iabbrev aa λ

" Plugins -------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Syntax
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'

" Theme
Plug 'easysid/mod8.vim'
Plug 'sjl/badwolf'


Plug 'bling/vim-airline'

call plug#end()

" Plugins configuration -----------------------------------------------
colorscheme mod8 " Theme
let g:airline_powerline_fonts = 1

