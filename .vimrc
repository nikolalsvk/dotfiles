set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'renderedtext/vim-bdd'       " Run Ruby and Elixir tests
Plugin 'kien/ctrlp.vim'             " Fuzzy search
Plugin 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plugin 'vim-airline/vim-airline'    " Vim powerline
Plugin 'nikolalsvk/vim-rails'       " Rails plugin
Plugin 'tpope/vim-cucumber'         " Open Cucumber step definitions
Plugin 'tpope/vim-fugitive'         " :Gblame
Plugin 'tpope/vim-endwise'          " Autocomplete end after a do
Plugin 'tpope/vim-repeat'           " Expand . functionality
Plugin 'tpope/vim-commentary'       " Comment out code
Plugin 'mileszs/ack.vim'            " Use ack in Vim
Plugin 'thisivan/vim-bufexplorer'   " Explore buffer
Plugin 'plasticboy/vim-markdown'    " Markdown syntax
Plugin 'ervandew/supertab'          " Complete using <Tab>
Plugin 'elixir-lang/vim-elixir'     " Elixir syntax
Plugin 'prettier/vim-prettier'      " Code formatter
Plugin 'pangloss/vim-javascript'    " JavaScript syntax

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Leader key is SPACE, I find it the best
let mapleader = " "

" Look and Feel settings
syntax enable
set background=dark
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
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Ack tricks
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir={.bundle,vendor/bundle,.git,node_modules} --ignore-file=is:tags"
nmap <leader>a :Ack ""<Left>
nmap <leader>A :Ack "\b<cword>\b"<CR>

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

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

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

" Shortcuts
" Open Buffer
nnoremap <silent><leader>l :BufExplorer<CR>
" Open test file for a current file
nnoremap <silent><leader>s :A<CR>
" Open test file for a current file in a vertical window
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
