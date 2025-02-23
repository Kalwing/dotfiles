call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'chrisbra/vim-commentary' "gc and gcc
" Markdown
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
" Syntax Highlighting
Plug 'hail2u/vim-css3-syntax'
Plug 'luochen1990/rainbow'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ap/vim-css-color'
Plug 'isobit/vim-caddyfile'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elzr/vim-json'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion
Plug 'preservim/nerdtree'
" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

call plug#end()

syntax enable
set background=dark
try
   colorscheme palenight
catch
    echo "Couldn't catch palenight"
endtry
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1

if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif
" Only solution that worked to have Vim colorscheme in tmux
if exists('+termguicolors') && ($TERM == "xterm-256color" || $TERM == "tmux-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
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

set spelllang=en_us,fr

let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'python=py', 'javascript=js']

inoremap fj <Esc>
vnoremap fj <Esc>

"Highlight search
set hls
"Incremental search (search as you type)
set incsearch

"  COC

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice -> ENTER
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-prettier', 'coc-yank', 'coc-vetur', 'coc-htmldjango', 'coc-tailwindcss', 'coc-yaml', 'coc-eslint', 'coc-java']

" Airline
let g:airline#extensions#tabline#enabled = 1
set showcmd

" Tags
" enable gtags module
let g:gutentags_modules = ['ctags']
let g:GtagsCscope_Quiet = 0
" config project root markers.
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/vim/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" Generate tags in most cases
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" Generate more infos for the tags
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

" Faster build
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ 'build',
      \ 'dist',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*.pyc',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

