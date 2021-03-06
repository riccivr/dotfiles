set shell=/bin/bash

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'powerline/fonts'
Plug 'tpope/vim-surround'
Plug 'gcmt/breeze.vim'
Plug 'kien/ctrlp.vim' | Plug 'dbeecham/ctrlp-commandpalette.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'tmhedberg/matchit'
Plug 'KabbAmine/vullScreen.vim'

" colorscheme
Plug 'NLKNguyen/papercolor-theme'
" colorscheme for gvim
Plug 'jscappini/material.vim'

" syntax highlighting plugins
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'

call plug#end()

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" colorscheme related
set t_Co=256
set background=dark
colorscheme PaperColor
"let g:PaperColor_Dark_Override = { 'background' : '#12292F' }
hi Normal ctermbg=none

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

" do not history when leavy buffer
set hidden

" highlight current line
set cursorline

" set gui font
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline\ 12

" load neocomplete
let g:neocomplete#enable_at_startup = 1

" load vimfiler as default
let g:vimfiler_as_default_explorer = 1

" emmet
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode 
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 

" CtrlPCommandPalette
nnoremap <S-p> :CtrlPCommandPalette<cr>

" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Find
map <C-f> /
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> "+d
vmap <C-v> "+p
vmap <C-c> "+y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" lazy ':'
map \ :

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

" NERDcommenter mappings
vnoremap ,x :call NERDComment(0,"toggle")<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
