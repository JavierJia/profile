" 20110422, Javier First Handy vimrc

set nocompatible
filetype plugin indent on
syntax on
set number

" tab
set expandtab
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

" set tags
set tags=./tags;/

" bundle:
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle "Chiel92/vim-autoformat"
Bundle "einars/js-beautify"
" git repos on your local machine (ie. when working on
" your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki forFAQ
" NOTE: comments after Bundle command arenot allowed..
"======================================================Bundle ===========

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

