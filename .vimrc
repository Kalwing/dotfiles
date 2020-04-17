call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

syntax enable
set background=dark
try
    colorscheme palenight
catch
endtry
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" RealPython config
" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
