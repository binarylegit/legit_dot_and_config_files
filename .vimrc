set nocompatible

set number

" Mac needs these things
set ai
set history=100
set ruler
syntax on
set hlsearch
set incsearch
filetype plugin on

set t_Co=256
set background=dark
set noerrorbells
set foldmethod=syntax
set foldcolumn=5
set nofoldenable
set ignorecase

set tabstop=2
set expandtab

let g:liquidcarbon_high_contrast=1

"colorscheme solarized
"colorscheme desert
" http://www.vim.org/scripts/script.php?script_id=3274
colorscheme liquidcarbon

imap ;l <ESC>

if has("gui_running")
set guioptions-=T
endif

au BufNewFile,BufRead *.gradle setf groovy
"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
