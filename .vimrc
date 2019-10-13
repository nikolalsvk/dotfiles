set nocompatible " be iMproved, required
filetype off     " required

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

Plug 'renderedtext/vim-bdd'     " Run Ruby and Elixir tests
Plug 'airblade/vim-gitgutter'   " Show git diff of lines edited
Plug 'vim-airline/vim-airline'  " Vim powerline
Plug 'nikolalsvk/vim-rails'     " Rails plugin
Plug 'tpope/vim-cucumber'       " Open Cucumber step definitions
Plug 'tpope/vim-fugitive'       " :Gblame
Plug 'tpope/vim-endwise'        " Autocomplete end after a do
Plug 'tpope/vim-repeat'         " Expand . functionality
Plug 'mileszs/ack.vim'          " Use ack in Vim
Plug 'thisivan/vim-bufexplorer' " Explore buffer
Plug 'plasticboy/vim-markdown'  " Markdown syntax
Plug 'ervandew/supertab'        " Complete using <Tab>
Plug 'elixir-lang/vim-elixir'   " Elixir syntax
Plug 'prettier/vim-prettier'    " Code formatter
Plug 'pangloss/vim-javascript'  " JavaScript syntax
Plug 'mxw/vim-jsx'              " JSX syntax
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'         " Set up fzf and fzf.vim

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

" Leader key is SPACE, I find it the best
let mapleader = " "

" Look and Feel settings
syntax enable
set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
let g:jsx_ext_required = 0 " enable JSX syntax highlight in .js files

" Numbers
set number
set numberwidth=4
set ruler

" paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

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
let g:ackprg = 'ag --vimgrep'
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

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" +++ Shortcuts +++
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
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Map fzf to CTRL P
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>

" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
