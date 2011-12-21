" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set autoindent        " always set autoindenting on

" An example for a vimrc file.
nnoremap <silent> <A-1> :tabnext<CR>
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"          for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"        for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup        " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  "au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on
  filetype on
  filetype plugin on
  filetype indent on

  set laststatus=2
  set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

  " set cul " highlight cursor's line
  set nu " line number on 
  set paste

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")


" format xml filetypes
map <silent> <C-f3> :silent 1,$!xmllint --format --recover - 2>/dev/null <CR> :set filetype=xml<cr>

set noerrorbells
"set vb
"set t_vb=
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif

" colo desert
" colo zenburn
colo molokai

" set guifont=Courier_New:h9:cANSI
set guifont=Envy_Code_R:h9:cANSI
" set guifont=Envy_Code_R:h10:cANSI

set nohls

cs add ~/.cscope/cscope.out

set backup
set backupdir=$TMP
set directory=$TMP

"se nu

set winaltkeys=yes

" Tabs
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-Tab> :tabnext<CR>
nnoremap <silent> <C-S-Tab> :tabprevious<CR>
nnoremap <silent> <C-q> :q!<CR>
nnoremap <silent> <M-1> :tabfirst<CR>
nnoremap <silent> <M-2> :tabfirst<CR> :tabnext<CR>

" Copy/paste: 
map <c-c> "+y 
map <c-x> "+x
map <c-v> "+gP
vmap <c-v> "+gP
imap <c-v> "+gP

imap <C-j> <ESC>ji
imap <C-k> <ESC>ki
imap <C-h> <ESC>i
imap <C-l> <ESC>lli

" switch between modes
map <S-cr> i
imap <S-cr> <esc>

" Trying to highlight word under cursor:
" map <S-C-h> :execute 'match :
" highlight MyGroup ctermbg=green guibg=green
map <silent> <C-H> :match IncSearch /<c-r>=expand("<cword>")<cr>/<cr>
map <silent> <C-J> :match Normal /<c-r>=expand("<cword>")<cr>/<cr>

set path+=$SRCPATH

" Compile java using ant:
" set makeprg=~/workspace/ngts_max/build/ant/bin/ant\ -Denv_file= env.local.properties\ -Dproperty_file=windows.properties\ -Doc4j.ngts.dir=/usr/etc/oc4j-ejb\ -Doc4j.ngts.port=4000\ -Doc4j.sbt.dir=/usr/etc/oc4j-all\ -Doc4j.sbt.port=4001\ -Doc4j.cpp.dir=/usr/etc/oc4j-all\ -Doc4j.cpp.port=4001\ \ $1\ $2\ $3\ $4\ $5\
" set makeprg=cd\ ~/workspace/ngts_max/build/;\ build.sh
" set errorformat=%A%*\s%[javac%\]\ %f:%l:\ %m,%Z%*\s%[javac%\]\ symbol%*\s:\ %m

map ,cd :cd %:p:h<cr>

" Create fold (make sure you are on a spot where you can use %)
map <f5> zf%

" Open/close fold
map <f4> za

map <c-s> :w<cr>

iab sout System.out.println(

set hidden

nnoremap ' `
nnoremap ` '

runtime macros/matchit.vim

abbrev sout System.out.println(

" map <f3> :%s/\n/','/g<esc>I'<esc>A'<esc>
map <f3> :%j<cr>:%s/ /','/g<cr>i'<esc>A'<esc>
map <f4> :%j<cr>:%s/ /,/g<cr>


