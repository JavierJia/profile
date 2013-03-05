" 20110422, Javier First Handy vimrc

set nocompatible
filetype off
call pathogen#infect()
filetype on
filetype plugin indent on
syntax on
set number

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set cursorline

set ignorecase
set smartcase
set incsearch
set hlsearch

" format
set nowrap
set autoindent
set smartindent
set showmatch	

" fold
set foldenable
set foldmethod=indent
set wrap

" encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" set tags
set tags=./tags;/

" Python
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

