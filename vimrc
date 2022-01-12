scriptencoding utf-8
set encoding=utf-8
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set hlsearch
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
set ttymouse=xterm2
set backspace=eol,start,indent " backspace mode
" Clippboard Compartilhada
set clipboard=unnamedplus 
set autoindent
set pastetoggle=<F2>
set sm               " Show Matching Pairs 
set title
set wildmenu
set ic scs
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.mwv,*.flv,*.pdf,*.chm,*.dvi,*.svn,*~,*.pyc

nno <C-L> <Esc>:let @/=""<CR>


call plug#begin()

Plug 'scrooloose/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
"Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'yggdroot/indentLine' 

call plug#end()

"GUI Config ------------------------------------------------------------------

if has('gui_running')
    set guioptions-=T
    set guifont=agave\ Nerd\ Font\ Mono:h13
    set backspace=2
    set lines=60 columns=125 linespace=0
   " Auto Comandos
   " au VimEnter *  NERDTree
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

" Airline (visuais)-----------------------------------------------------------
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" NerdTree

nmap <C-a> :NERDTreeToggle<CR>

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" IndentLine

let g:indentLine_enable = 1
map <C-k>i :IndentLinesToggle<cr>

let g:indentLine_char_list = ['|', 'Â¦', 'â”†', 'â”Š']


"let g:indentLine_char = ''
" Auto Comandos


