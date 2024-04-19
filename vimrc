syntax on            " Enable syntax highlight
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

"set autochdir         " Auto change dir to dir of current file
set nocompatible     " Forget about old vi compatibility
set noshowmode       " Not display mode on command linke since we display mode in statusbar
set number           " Display line number
set relativenumber   " Make linenumbers relative to cursor line
set path=$PWD/**         " Let FIND and other stuff locate files recursively
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
set shortmess+=c     " Disable completion messages
set backspace=eol,start,indent
set clipboard=unnamedplus " Clippboard Compartilhada
"set paste
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.mwv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~,*.pyc,**/.git/**,**/__pycache__/**,**/.venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp,**/undodir/**
set visualbell t_vb=
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
set ttimeout
set ttimeoutlen=1
set ttyfast
set formatoptions-=t
set background=dark
set undodir=~/.vim/undodir
set undofile
"set guicursor+=a:blink0
set grepprg=rg\ --vimgrep\ --hidden
"set grepprg=git\ grep\ -n\ --column

if v:version >= 900
    set wildoptions=pum
endif



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
let &t_SR = "\e[3 q"

colorscheme slate

command! MakeTags !ctags-exuberant .

function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
"command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
"cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
"    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END



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

nnoremap <silent><leader>e :Lex<CR>
nnoremap <leader>ff :find 
nnoremap <leader>fw :Grep 
nnoremap <silent><leader>c :bd<cr>
nnoremap <leader>b :b 
nnoremap <leader>gg :silent call system('lazygit') <cr>:redr!<cr>

" go to definition
nnoremap gd g<c-]>

" Navigate quickfix list on normal mode
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>

" Remap cedilla to : so pt-br keyboars can access command without shift
nnoremap ç :
nnoremap Ç :
vnoremap ç :
vnoremap Ç :

" Make current word UNDER cursor uppercase (only insert mode)
inoremap <c-h> <esc>lgUiwi

" Shortcuts for SPLIT navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Display Current buffer file info
nnoremap <c-g> 1<c-g>

"nmap <Down> gj
"nmap <Up> gk
"set fo=1

" Duplicate current line
nmap <silent> <leader>du :t. <CR>
" CTRL+UP = Move current Line UP
" CTRL+DOWN  = Move current line DOWN
nnoremap <silent><C-Down> :m .+1<CR>==
nnoremap <silent><C-Up> :m .-2<CR>==
inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
vnoremap <silent><C-Up> :m '<-2<CR>gv=gv

" Cycle buffes pressing TAB
nnoremap <silent><Tab> :bn<CR>
nnoremap <silent><S-Tab> :bp<CR>

" map <silent> <C-l> :nohlsearch<CR>
" nnoremap <silent><Esc> :let @/=""<CR><esc>
" map <silent><esc> :noh<cr>
noremap <silent><CR> :let @/="" <CR> <CR>

" Prevent loosing visual selection when indenting
vnoremap > >gv
vnoremap < <gv
" Also indent with tab and shift-tab
vnoremap <tab> >gv
vnoremap <s-tab> <gv


" Momentary normal mode
inoremap <c-o> <c-\><c-o>


" Paste Tricks
nnoremap ,p "0p
nnoremap ,P "0P
vnoremap ,p "0p
vnoremap ,P "0P

" let curor on center of screen shen moving half pages
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz

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


function TurnOffCaps()
    let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
    if capsState == 'on'
        silent! execute ':!xdotool key Caps_Lock'
    endif
endfunction


function! ToggleComment(comment_char)
    if getline(".") =~ "^" . a:comment_char
        execute ".s/^" . a:comment_char . "//g"
    else
        execute ".s/^/" . a:comment_char . "/g"
    endif
endfunction



silent! nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>
silent! nnoremap <silent> <F6> :call StripBlankLines()<CR>


" Auto Comands

" If vim was compiled with suport for autocmd
if has("autocmd")
    autocmd FileType qf nnoremap <buffer><silent><esc> :cclose<CR>
    autocmd FileType qf nnoremap <buffer><silent><c-n> :cnext<CR>:cclose<cr>:copen<cr>
    autocmd FileType qf nnoremap <buffer><silent><c-p> :cprev<CR>:cclose<cr>:copen<cr>
    autocmd FileType help nnoremap <buffer><silent><esc> :bd<cr>

    autocmd FileType netrw autocmd BufLeave <buffer> if &filetype == 'netrw' | :bd | endif

    " Comments
    autocmd FileType vim nnoremap <buffer> gc :call ToggleComment('"')<CR>
    autocmd FileType php,sh,zsh,bash,markdown nnoremap <buffer> gc :call ToggleComment("#")<CR>
    autocmd FileType vim vnoremap <buffer> gc :call ToggleComment('"')<CR>gv
    autocmd FileType php,sh,zsh,bash,markdown vnoremap <buffer> gc :call ToggleComment("#")<CR>gv

    " autocmd FileType qf nnoremap <buffer> q :lclose<CR>
    autocmd InsertLeave * call TurnOffCaps()
    " Strip trailing spaces from theese type of files before save
    autocmd BufWritePre *.py,*.lua,*.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.js,*.json,*.coffee,*.html,*.md,*.rdoc,*.textile :call StripTrailingWhitespaces()
endif


" Statusline Stuff-------------
" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan


let b:keymap_name = "CAPS"

" Status Line Custom
let g:currentmode={
    \ 'n'      : 'Normal',
    \ 'no'     : 'Normal·Operator Pending',
    \ 'v'      : 'Visual',
    \ 'V'      : 'V·Line',
    \ "\<C-V>" : 'V·Block',
    \ 's'      : 'Select',
    \ 'S'      : 'S·Line',
    \ "\<C-S>" : 'S·Block',
    \ 'i'      : 'Insert',
    \ 'R'      : 'Replace',
    \ 'Rv'     : 'V·Replace',
    \ 'c'      : 'Command',
    \ 'cv'     : 'Vim Ex',
    \ 'ce'     : 'Ex',
    \ 'r'      : 'Prompt',
    \ 'rm'     : 'More',
    \ 'r?'     : 'Confirm',
    \ '!'      : 'Shell',
    \ 't'      : 'Terminal'
    \}

set statusline=
set statusline+=%k
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %n\                                 " Buffer number

"set statusline=%<%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\%=\ col:%04v\ ln:%04l\/%04L\ h:%03.3B\ a:%03.3b\ %03P

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
