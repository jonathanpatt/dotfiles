" load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" disable vi compatibility
set nocompatible

" prevent security exploit
set modelines=0

" disable code folding
set nofoldenable

" use indents of 4 spaces, and copy down lines
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" make things better
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" map leader to comma
let mapleader = ","

" map F-keys
map <F2> :NERDTreeToggle<CR>

" improve search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" show invisibles
set list
set listchars=tab:▸\ ,eol:¬,nbsp:·

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" syntax highlighting
syntax on
syntax enable

" line numbering
set number

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" cursor bounce to matching braces
set showmatch

" colors
colorscheme koala

" highlighting
if has('gui_running')
    autocmd WinEnter,BufRead * setlocal cursorline
    autocmd WinEnter,BufRead * setlocal cursorcolumn
endif

" font
set guifont=Inconsolata-dz:h14

" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php '%'<CR>

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l '%'<CR>

" strip whitespace in current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" fold tag
nnoremap <leader>ft Vatzf

" normal mode shortcut
inoremap jj <ESC>

" vertical split and switch to shortcut
nnoremap <leader>w <C-w>v<C-w>l

" split motion shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" statusline
set statusline=%f%m%r%h%w\ \|\ %{&ff}\ \|\ %Y\ \|\ %p%%\ \|\ %L\%=%{fugitive#statusline()}
set laststatus=2

" php syntax highlighting
autocmd FileType php set commentstring=//\ %s
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
let php_folding = 1

" NERDTree ignore
let NERDTreeIgnore=['^empty$']

" filetype indent
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

" preserve file metadata
set backupcopy=yes

" snipmate settings
let g:snips_author = 'Jonathan Patt <jonathanpatt@gmail.com>'

" Tabular mappings
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <leader>a: :Tabularize /:\zs/l0l1<CR>

" change yankring file location
let g:yankring_history_file = '.yankring_history'

" shortcut to select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" disable phpcs in syntastic
let g:syntastic_phpcs_disable=1

" enable rainbow parentheses permanently
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

filetype plugin on
set ofu=syntaxcomplete#Complete

" supertab
let g:SuperTabDefaultCompletionType = "context"
