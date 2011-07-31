" Setup pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=500                " keep 50 lines of command line history
set ruler                       " show the cursor position all the time
set number			" show line numbers
set showcmd
set incsearch
set hlsearch

let mapleader=","

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

syntax enable

"set t_Co=256 " 256 colors
color vividchalk

" Copied from somewhere else

" Formatting (some of these are for coding in C and C++)
set ts=2 "  Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" Show $ at end of line and trailing space as ~
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"http://nvie.com/posts/how-i-boosted-my-vim/
set nobackup
set noswapfile
set pastetoggle=<F2>
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
nmap <silent> ,,t :CommandTFlush<CR>
