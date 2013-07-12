" Setup pathogen
filetype on
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

" vim-powerline
set nocompatible " Disable vi-compatibility
set laststatus=2 " Always show the statusline
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors

" command-t
"set wildignore+=.git

" taglist
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

" Nerd Commenter
filetype plugin on


syntax enable

"set t_Co=256 " 256 colors
"color vividchalk
" http://stackoverflow.com/questions/8640276/highlight-line-in-vim-but-not-underlying
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
set cursorline
hi CursorLine ctermbg=233 cterm=none

"VimClojure
let vimclojure#WantNailgun = 0
let vimclojure#ParenRainbow = 1
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

au BufRead,BufNewFile *.afl set filetype=amibroker
au! Syntax amibroker source $HOME/.vim/syntax/amibroker.vim

set fileformat=unix

