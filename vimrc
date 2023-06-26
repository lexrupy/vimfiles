
syntax on            " Enable syntax highlight
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

""set autochdir         " Auto change dir to dir of current file
set nocompatible
set path+=**
set number           " Enable line numbers
set relativenumber   " Define numbers as relative
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
""set ignorecase       " Ingore case in search
set hlsearch         " Highlight the search matches
""set smartcase        " Consider case if there is a upper case character
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
set clipboard=unnamedplus " Clippboard Compartilhada
"set paste
set wildmenu
set wildignore=tags,*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~,*.pyc
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
set showcmd
set termwinsize=10x0
let s:windows_os = has("win16") || has("win32") || has("win64")

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

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
let g:netrw_bufsettings = 'noma nomod nobl nowrap ro'

nnoremap <Leader>ef :Lexplore %:p:h<CR>
nnoremap <Leader>ee :Lexplore<CR>


call plug#begin()
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'
"    Plug 'yggdroot/indentLine'
    "Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'tomasr/molokai'
    Plug 'gummesson/stereokai.vim'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'liuchengxu/vim-which-key'

call plug#end()


" Plugins Configuration
" =============================================================================
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif




" WichKey----------------------------------------------------------------------

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Define prefix dictionary
let g:which_key_map =  {}

call which_key#register('<Space>', "g:which_key_map")



" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>ff :Files<CR>
let g:which_key_map.f.f = 'fuzzy-finder'

nnoremap <silent> <leader>fr :so $MYVIMRC<CR>
let g:which_key_map.f.r = 'reload-vimrc'

" Git shortcuts -------------------------------------------
"let g:which_key_map.g = {
            "\ 'name' : '+git',
            "\ 'g' : ['Git', 'git-status'],
            "\ 'c' : ['Git commit', 'git-commit'],
            "\}

"let g:which_key_map.g.a = {
            "\ 'name' : '+add',
            "\ 'c' : ['Git add %', 'git-add[current-file]'],
            "\ 'a' : ['Git add .', 'git-add[all]'],
            "\}


            
            let g:which_key_map.g = { 'name' : '+git' }
nnoremap <silent> <leader>gg :Git<CR>
let g:which_key_map.g.g = 'git-status'

nnoremap <silent> <leader>gd :Git diff<CR>
let g:which_key_map.g.d = 'git-diff[all]'

nnoremap <silent> <leader>gs :Gdiffsplit<CR>
let g:which_key_map.g.s = 'git-split-diff[current-file]'

nnoremap <silent> <leader>gb :Git blame<CR>
let g:which_key_map.g.b = 'git-blame'

nnoremap <silent> <leader>gl :Git log<CR>
let g:which_key_map.g.l = 'git-log'

let g:which_key_map.g.a = { 'name' : '+add' }

nnoremap <silent> <leader>gac :Git add %<CR>
let g:which_key_map.g.a.c = 'add current-file'

nnoremap <silent> <leader>gaa :Git add .<CR>
let g:which_key_map.g.a.a = 'add current-file'

nnoremap <silent> <leader>gc :Git commit<CR>
let g:which_key_map.g.c = 'git-commit'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>

let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ 't' : ['terminal', 'terminal'],
      \ }

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"
" Note:
" Some complicated ex-cmd may not work as expected since they'll be
" feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }



let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

" NerdTree---------------------------------------------------------------------

nnoremap <leader>e :NERDTreeToggle<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr('') | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Airline (visuais)-----------------------------------------------------------
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"GUI Config ------------------------------------------------------------------
set guioptions=i

if has('gui_running')
    if s:windows_os
        set guifont=agave\ Nerd\ Font\ Mono:h13
    else
        set guifont=agave\ Nerd\ Font\ Mono\ 13
    endif
    set backspace=2
    set lines=60 columns=125 linespace=0
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme molokai

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"nmap <Down> gj
"nmap <Up> gk
"set fo=1

" Normal Mode Remaps
" Open Fuzzy Finder
"nnoremap <leader>f :Files<CR>

" CTRL+DOWN  = Move current line DOWN
nnoremap <C-Down> :m .+1<CR>==
" CTRL+UP = Move current Line UP
nnoremap <C-Up> :m .-2<CR>==
" Duplicate line under cursor
nmap <silent> <leader>du :t. <CR>
" Move current line DOWN
inoremap <C-Down> <Esc>:m .+1<CR>==gi
" Move current selection DOWN
vnoremap <C-Down> :m '>+1<CR>gv=gv
" Move current line UP
inoremap <C-Up> <Esc>:m .-2<CR>==gi
" Move current selection UP
vnoremap <C-Up> :m '<-2<CR>gv=gv
" Cycle buffers with TAB/SHIFT-TAB
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" For convenience in abnt keyboards, remap ç to :
nnoremap ç :
nnoremap Ç :
" Clear search highlights
nno <F4> <Esc>:let @/=""<CR>
" Toggle Relative Line Numbers NORMAL mode
nmap <silent><F3> :exe'se'&nu+&rnu?'rnu!':'nu'<CR>
" Toggle Relative Line Numbers INSERT mode
imap <silent><F3> <esc> :exe'se'&nu+&rnu?'rnu!':'nu'<CR>I

" Shift fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Wq wq
cmap Q q
cmap Tabe tabe


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


function! QuitNetrw()
  for i in range(1, bufnr($))
    if buflisted(i)
      if getbufvar(i, '&filetype') == "netrw"
        silent exe 'bwipeout ' . i
      endif
    endif
  endfor
endfunction


silent! nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>
silent! nnoremap <silent> <F6> :call StripBlankLines()<CR>


" Auto Comandos

" If vim was compiled with suport for autocmd
if has("autocmd")
  " Strip trailing spaces from theese type of files before save
  autocmd BufWritePre *.py,*.lua,*.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.js,*.json,*.coffee,*.html,*.md,*.rdoc,*.textile :call StripTrailingWhitespaces()
  autocmd FileType netrw setl bufhidden=wipe
  autocmd VimLeavePre *  call QuitNetrw()
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

