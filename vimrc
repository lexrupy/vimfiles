" *  .vimrc
" * Author: Alexandre da Silva
" *

" Start patogen
call pathogen#infect()

" Use Vim Settings
set nocompatible

" On Unix use bash
if has("unix")
  let &shell="bash"
  set clipboard=autoselect
endif

" Show Line Numbers
set number

" Show Current Mode
set showmode

set cpoptions=aABceFsmq
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

" Use the DESERT colorscheme by default
colorscheme desert

" Use dark background
set background=dark

" Always change dir to the dir of current file
" set autochdir

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
set window=10

" The number of lines to scroll with ^U ^D
set scroll=5

" Tell if something is wrong
set visualbell

" Don't make noise
set noerrorbells

" Enable Autosave
" set autowrite
" set autowriteall

" Boost window redraw
set ttyfast

" Creates a backup of a file before save it
set bk

" Set the backup dir
set backupdir=~/.vim/.backup,.

" Always show the statusline
set laststatus=2

" Defines what goes in statusline
set statusline=%<%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\ 
                \%=\ col:%04v\ lin:%04l\
                \/%04L\ hex:%03.3B\ ascii:%03.3b\ %03P\

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

" Title of window prompt is the file name
set title

" Turn on line completion wild style
set wildmenu

" Ignore theese list of file extensions
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,\
              \*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~

" Turn on wild mode huge list
set wildmode=list:longest

" Command line history
" Open cmdline with ESC
set cedit=<esc>

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
set list

" A tab = >- and a trailing space = -
set listchars=tab:>-,trail:-

" Blink matching brackets for n time
set matchtime=5

" Shortness messages to avoid 'Press a key' prompts
set shortmess=aOstT

" Disable autowrap lines
set nowrap

" Set the right margin size for autowrap
" set wm=1

" When with 3 spaces and hit > go to 4, not 5
set shiftround

" Settings whe using GUI Version
if has("gui_running")
 " Large window size
 
 " The number of window columns
 set columns=100

 " The number of window lines
 set lines=30
 
 " Some GUI Options
 set guioptions=ce
 "              ||
 "              |+- Use simple dialogs rather than pop-ups
 "              +-- Use GUI Tabs, not console style tabs
 " Default Font for GUI *** CHOOSE Another for Other OSes
 set guifont=Monaco:h12

 " Hide mouse cursor when typing
 set mousehide
endif

if has("gui_macvim")
  " Activate PeepOpen
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen

end

