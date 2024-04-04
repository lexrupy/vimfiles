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
set hlsearch         " Highlight the search matches
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=1      " Give more space for displaying messages
set updatetime=500   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
set laststatus=2     " Always show the statusline
set shortmess+=c
set backspace=eol,start,indent
set clipboard=unnamedplus " Clippboard Compartilhada
"set paste
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~,*.pyc
set visualbell t_vb=
set ttyfast
set sm
set matchtime=5
set showbreak===>
set nowrap
set list
set listchars=tab:▸\ ,eol:↵,trail:🢖,extends:>,precedes:<
set nobackup         " No backup files
set nowritebackup    " No backup files
set noswapfile       " No swap files
set wm=1 " Set the right margin size for autowrap
set shiftround " When with 3 spaces and hit > go to 4, not 5
"set ttymouse=xterm2
set formatoptions-=t
set background=dark
set statusline=%<%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\%=\ col:%04v\ lin:%04l\/%04L\ hex:%03.3B\ ascii:%03.3b\ %03P
set undodir=~/.vim/undodir
set undofile

set grepprg=rg\ --vimgrep\ --hidden


"Change cursor type on insert mode (test if it works depend on terminal)
"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

colorscheme habamax

command! MakeTags !ctags-exuberant .

let ghregex='\(^\|\s\s\)\zs\.\S\+'

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize = 30
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=','. ghregex
let g:netrw_hide = 1

let mapleader = ' '

nnoremap <leader>e :Lex<CR>
nnoremap <leader>ff :find
nnoremap <leader>fw :grep
nnoremap <leader>c :bd<cr>

" go to definition
nnoremap gd g<c-]>

" Remap cedilla to : so pt-br keyboars can access command without shift
nnoremap ç :
nnoremap Ç :
vnoremap ç :
vnoremap Ç :


" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"nmap <Down> gj
"nmap <Up> gk
"set fo=1

" Duplicate current line
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
" map <silent> <Esc> :let @/=""<CR>
map <silent> <Esc> :nohlsearch<CR>

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


" Auto Comands

" If vim was compiled with suport for autocmd
if has("autocmd")
  " Strip trailing spaces from theese type of files before save
  autocmd BufWritePre *.py,*.lua,*.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.js,*.json,*.coffee,*.html,*.md,*.rdoc,*.textile :call StripTrailingWhitespaces()
endif

