set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'renderedtext/vim-bdd'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'thisivan/vim-bufexplorer'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = " "

" Look and Feel settings
syntax enable
set background=dark
colorscheme base16-eighties
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches

" Numbers
set number
set numberwidth=4
set ruler

" paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

" disable cursor keys in normal mode
map <Left>  :echo "no! use h!"<cr>
map <Down>  :echo "no! use j!"<cr>
map <Up>    :echo "no! use k!"<cr>
map <Right> :echo "no! use l!"<cr>

" Treat long lines as break lines
map j gj
map k gk

" Indentation
set autoindent
set cindent
set smartindent

" Folding
set nofoldenable " disable folding

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase

" Always show the status line
set laststatus=2

" set correct filetypes for various languages
au BufRead,BufNewFile *.go setlocal filetype=go
au BufRead,BufNewFile *.cap setlocal filetype=ruby
au BufRead,BufNewFile Capfile* setlocal filetype=ruby

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" Ack vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column  --ignore-dir={.bundle,vendor/bundle,.git} --ignore-file=is:tags"
" Search word under cursor
nnoremap F :Ack "\b<cword>\b"<CR>

" Shortcuts
" Open Buffer
nnoremap <silent><leader>l :BufExplorer<CR>
" Open test file for a file that your are reading
nnoremap <silent><leader>s :A<CR>
nnoremap <silent><leader>v :AV<CR>
" Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
" Split screen
nnoremap <silent><leader>- :split<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>
nnoremap <silent><leader>1 :source ~/.vimrc \| :PluginInstall<CR>
" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
