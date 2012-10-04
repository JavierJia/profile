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

" Python
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
