" *  .vimrc
" * Author: Alexandre da Silva
" *

"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

" Start patogen
call pathogen#infect()

" On Unix use bash
" if has("unix")
"   let &shell="bash"
"   set clipboard=autoselect
" endif

" Show Line Numbers
set number

" Show Current Mode
set showmode

" set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch)
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name

" Enable Syntax Highlight
syntax on

" Enable filetype detection and make language-dependent
filetype plugin indent on

" Use the RAILSCASTS colorscheme by default
colorscheme railscasts

" Use dark background
set background=dark

" Always change dir to the dir of current file
set autochdir

" Enable autoindent
set autoindent

" To disable autoindent when pasging press F2
set pastetoggle=<F2>

" Show the ruller
set ruler

" Auto load modified file
set autoread

" Defines the tab size to 2 cols
set ts=2

" Convert tabs in spaces by default
set expandtab

" Number of cols to indent un-indent
set sw=2

" Show matching pairs braces
set sm

" Show the executed commands
set showcmd

" Report actions at footer
set report=0

" Define a sane backspace behavior
set backspace=eol,start,indent

" Number of tabs to go back when press backspace
set softtabstop=2

" The window size for scroll with ^B ^F
" set window=10

" The number of lines to scroll with ^U ^D
" set scroll=5

" Tell if something is wrong
set visualbell t_vb=

" Don't make noise
" set noerrorbells

" Enable Autosave
" set autowrite
" set autowriteall

" Boost window redraw
set ttyfast

" Creates a backup of a file before save it
" set bk

" Set the backup dir
" set backupdir=~/.vim/.backup,.

" Always show the statusline
set laststatus=2

" Defines what goes in statusline
"
set statusline=%f " Tail of the filename

" Git
" set statusline+=%{fugitive#statusline()}

" RVM
" set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file


" set statusline=%<%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\
"                 \%=\ col:%04v\ lin:%04l\
"                 \/%04L\ hex:%03.3B\ ascii:%03.3b\ %03P\

"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

" Turn of the toolbar in gvim/mvim
set guioptions=-T

" Set Mouse usefull on terminal
set mouse=a
set ttymouse=xterm2

" Title of window prompt is the file name
set title

" Hide buffers when not displayed
set hidden

" Turn on line completion wild style
set wildmenu

" Ignore theese list of file extensions
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,\
              \*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~

" Turn on wild mode huge list
set wildmode=list:longest

" Use tab to access wildmenu
set wildchar=<Tab>

" Command line history
" Open cmdline with ESC
" set cedit=<esc>

" Store this number of lines in history
set hi=5000

" Stores the cursor position and command line history
set viminfo='100,\"1000,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" Keep cursor at current position when scrolling
set nostartofline

" Highlight the search matches
set hlsearch

" Incremental search, search as you type
set incsearch

" Ignore case and Smart Case when Searching
set ic scs

" S-F11 to clear last search results
nno <S-F1> <Esc>:let @/=""<CR>

" Show tabs and trailing spaces
" set list

" A tab = >- and a trailing space = -
" set listchars=tab:>-,trail:-

" Blink matching brackets for n time
set matchtime=5

" Shortness messages to avoid 'Press a key' prompts
" set shortmess=aOstT

" Disable autowrap lines
" set nowrap

" Set the right margin size for autowrap
" set wm=1

" When with 3 spaces and hit > go to 4, not 5
" set shiftround

" Settings whe using GUI Version
" if has("gui_running")
 " Large window size

 " The number of window columns
 " set columns=145

 " The number of window lines
 " set lines=40

 " Some GUI Options
 " set guioptions=ce
 "              ||
 "              |+- Use simple dialogs rather than pop-ups
 "              +-- Use GUI Tabs, not console style tabs
 " set guifont=Monospaced:h12

 " Hide mouse cursor when typing
 " set mousehide
" endif

" NERDTree Configurations
"
" If no file is open autoload NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

" Close Vim if the only last window is a NERDTree window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" SnipMate configuration
"

" This seems to be the last thing to load
" if has("gui_macvim")
  " Configure PeepOpen
"   macmenu &File.New\ Tab key=<nop>
"   map <D-t> <Plug>PeepOpen

  " Set Monaco Font when in Mac
"   set guifont=Monaco:h12
" end

" Keyboard Mapping Stuff

" Use Ctrl + N to change tabs
"map <C-1> 1gt
"map <C-2> 2gt
"map <C-3> 3gt
"map <C-4> 4gt
"map <C-5> 5gt
"map <C-6> 6gt
"map <C-7> 7gt
"map <C-8> 8gt
"map <C-9> 9gt
"map <C-0> :tablast<CR>

" Tab Navigation
"map <Tab> gt
"map <S-Tab> gT

" TextMate Like indentation
"nmap <C-[> <<
"nmap <C-]> >>
"vmap <C-[> <gv
"vmap <C-]> >gv

" Q and K does nothing
"map Q <Nop>
"map K <Nop>

