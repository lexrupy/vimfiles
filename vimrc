
syntax on            " Enable syntax highlight
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

"set autochdir         " Auto change dir to dir of current file
set nocompatible
set relativenumber
set path+=**
set nu               " Enable line numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set ic scs           " SmartCase
set hlsearch         " Highlight the search matches
set smartcase        " Consider case if there is a upper case character
set scrolloff=2      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
set laststatus=2     " Always show the statusline
set shortmess+=c
set backspace=eol,start,indent
set clipboard=unnamed " Clippboard Compartilhada
"set paste
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~,*.pyc
set visualbell t_vb=
set ttyfast
set pastetoggle=<F2>
set sm
set matchtime=5
set showbreak===>
set nowrap
set list
set listchars=tab:▸\ ,eol:↵,trail:🢖,extends:>,precedes:<
set nobackup         " No backup files
set nowritebackup    " No backup files
set noswapfile       " No swap files
" Backup and swap dir are temporary dirs, so should go there
set backupdir=./.backup//
set directory=./.swp//
set wm=1 " Set the right margin size for autowrap
set shiftround " When with 3 spaces and hit > go to 4, not 5
set ttymouse=xterm2
set formatoptions-=t
let s:windows_os = has("win16") || has("win32") || has("win64")

let mapleader = 'ç'

command! MakeTags !ctags -R .

let ghregex='\(^\|\s\s\)\zs\.\S\+'

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize = 20
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=','. ghregex
let g:netrw_hide = 1

nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

call plug#begin()
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
"    Plug 'morhetz/gruvbox'
"    Plug 'ratazzi/blackboard.vim'
"    Plug 'sainnhe/sonokai'
"    Plug 'tomasr/molokai'
"    Plug 'arcticicestudio/nord-vim'
"    Plug 'nanotech/jellybeans.vim'
"    Plug 'fneu/breezy'
"    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'jiangmiao/auto-pairs'
    Plug 'yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

"GUI Config ------------------------------------------------------------------
set guioptions=i

if has('gui_running')
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

colorscheme molokai 
"set background=dark

" Configuracoes dos plugins --------------------------------------------------

" Airline (visuais)-----------------------------------------------------------
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Defines what goes in statusline

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Shortcuts for split navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

"nmap <Down> gj
"nmap <Up> gk
"set fo=1

nmap <silent> <leader>du :t. <CR>
" CTRL+UP = Move current Line UP
" CTRL+DOWN  = Move current line DOWN
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

"map <silent> <C-l> :nohlsearch<CR>
nno <F4> <Esc>:let @/=""<CR>

" Shift fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" IndentLine
let g:indentLine_enabled = 1
"map <C-k>i :IndentLinesToggle<cr>
let g:indentLine_char_list = ['|', '¦', '▹', '▸']
let g:indentLine_leadinSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '.'
"let g:indentLine_char = '.'

" Custom Functions
"
" Preserve history and cursor position while executing the given command
function! Preserve(command)
 " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
 " Do the business:
  execute a:command
 " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! StripTrailingWhitespaces()
  call Preserve("%s/\\s\\+$//e")
endfunction

function! StripBlankLines()
  call Preserve("g/^$/d")
endfunction

silent! nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>
silent! nnoremap <silent> <F6> :call StripBlankLines()<CR>


" Auto Comandos

" If vim was compiled with suport for autocmd
if has("autocmd")
  " Strip trailing spaces from theese type of files before save
  autocmd BufWritePre *.py,*.lua,*.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.js,*.json,*.coffee,*.html,*.md,*.rdoc,*.textile :call StripTrailingWhitespaces()
endif

" Windows Stuff
if s:windows_os
    if filewritable(expand('%:p:h')."\.")
        if !filewritable(expand('%:p:h').'\.backup')
            silent execute '!mkdir "'.expand('%:p:h').'\.backup"'
        endif
        if !filewritable(expand('%:p:h').'\.swp')
            silent execute '!mkdir "'.expand('%:p:h').'\.swp"'
        endif
    endif

    "set shell=powershell.exe
    "set shellcmdflag=-command
    "set shellquote=\"
    "set shellxquote=
else
    if filewritable(".")
        if ! filewritable(".backup")
            silent execute '!umask 002; mkdir .backup'
        endif
        if ! filewritable(".swp")
            silent execute '!umask 002; mkdir .swp'
        endif
    endif
endif


