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

let s:windows_os = has("win16") || has("win32") || has("win64")

" On Unix-Alike use bash
if has("unix")
  let &shell="bash"
  set clipboard=autoselect
endif

" Show Line Numbers
set number

" Show Current Mode
set showmode

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

" Tell if something is wrong
set visualbell t_vb=

" Boost window redraw
set ttyfast

" Creates a backup of a file before save it
set bk

" Backup and swap dir are temporary dirs, so should go there
if s:windows_os
  set backupdir=$TEMP\\
  set directory=$TEMP\\
else
  set backupdir=~/.vim/backupdir//
  set directory=~/.vim/swapdir//
endif

" Always show the statusline
set laststatus=2

" Defines what goes in statusline
"
set statusline=%<%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\%=\ col:%04v\ lin:%04l\/%04L\ hex:%03.3B\ ascii:%03.3b\ %03P

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
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~

" Turn on wild mode huge list
set wildmode=list:longest

" Use tab to access wildmenu
set wildchar=<Tab>

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

" Blink matching brackets for n time
set matchtime=5

" Shortness messages to avoid 'Press a key' prompts
set shortmess=aOstT

" Defines the wrap mode
set wrap
set linebreak
set nolist

" Visual line break
set showbreak===>

" Wrap doesn't work with listchars
" so, for now disable it.
" set nowrap

" Show tabs and trailing spaces
" set list

" A tab = >- and a trailing space = .
" set listchars=tab:>-,trail:.

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

" Set the right margin size for autowrap
set wm=1

" When with 3 spaces and hit > go to 4, not 5
set shiftround

" Settings whe using GUI Version
if has("gui_running")
  " Term 256 colors
  set t_Co=256

  colorscheme railscasts

  " Large window size
  " The number of window columns/lines
  set columns=145
  set lines=40

  " Some GUI Options
  set guioptions=ce
  "              ||
  "              |+- Use simple dialogs rather than pop-ups
  "              +-- Use GUI Tabs, not console style tabs
  set guifont=Monospaced:h12

  " Hide mouse cursor when typing
  set mousehide

  " Gnome specific configurations
  if has("gui_gnome")
    set term=gnome-256color
    colorscheme railscasts
    set guifont=Monospace\ Bold\ 12
  endif

  " Macos specific configurations
  if has("gui_mac")
    set guifont=Menlo:h14
  endif

  " Windows specific configurations
  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif

endif

" ==== FUNCTIONS ====


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

" ==== AUTOMATIONS ====

" If vim was compiled with suport for autocmd
if has("autocmd")
  " Strip trailing spaces from theese type of files before save
  autocmd BufWritePre *.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.js,*.json,*.coffee,*.html,*.md,*.rdoc,*.textile :call StripTrailingWhitespaces()
endif

" ==== PLUGIN CONFIGURATION ====

" Snipmate Setup

if s:windows_os
  source $HOME\vimfiles\snippets\support_functions.vim
else
  source ~/.vim/snippets/support_functions.vim
endif

" CtrlP - Ignore dotfiles and dotdirs
let g:ctrlp_dotfiles = 0

" CtrlP - heigth of match window
let g:ctrlp_max_height = 10

" CtrlP - change working path mode to use the parent directory only.
" 0: don't manage; 1: use the parent dir; 2: use the nearest .git/.svn/etc dir
let g:ctrlp_working_path_mode = 0

" Buffer Explorer Shortand
noremap <leader>b :BufExplorer<cr>

" NERDTree - Toggle
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>


" ==== REMAPEAMENTO DE TECLAS E MAPEAMENTO DE FUNCOES ====
"
" Remove trailing spaces from file
nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>

" Remove blank lines from file
nnoremap <silent> <F6> :call StripBlankLines()<CR>

" ; working like : for convenience
nnoremap ; :

" Shift fixex
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" Yank acts like Change and Delete, for consistency
nnoremap Y y$

