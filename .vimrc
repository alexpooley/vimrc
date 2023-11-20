" Install vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
" :PlugInstall
" :PlugUpdate
call plug#begin()

""" Utilies """
Plug 'wsdjeg/vim-fetch'
" Adjust 'shiftwidth' and 'expandtab' based on current file.
Plug 'tpope/vim-sleuth'
" :Remove, :Move, etc
Plug 'tpope/vim-eunuch'
" Fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
" Snippets
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

""" Vim presentation """
" Status line
Plug 'vim-airline/vim-airline'
" Color schemes
Plug 'aonemd/kuroi.vim'
Plug 'nanotech/jellybeans.vim'
" Distraction free writing
Plug 'junegunn/goyo.vim'

""" General programming """
" Parentheses handling. cs'" etc
Plug 'tpope/vim-surround'
" Comment handling, gcc.
Plug 'tpope/vim-commentary'
" Match language specific words like begin -> end.
Plug 'andymass/vim-matchup'
Plug 'Konfekt/FastFold'
" GitLab
" Plug 'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim'
" GitHub Copilot
Plug 'github/copilot.vim'

""" Program integration """
" Git
Plug 'tpope/vim-fugitive'
" Ruby
" Plug 'vim-ruby/vim-ruby'
Plug 'jlcrochet/vim-ruby'
" Rails
Plug 'tpope/vim-rails'
" Rspec
Plug 'thoughtbot/vim-rspec'
Plug 'rlue/vim-fold-rspec'
" Javascript
Plug 'pangloss/vim-javascript'
" Vue
Plug 'posva/vim-vue'

call plug#end()



set noswapfile
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab
set novisualbell
set noerrorbells
set number
set ruler
set nowrap

syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme jellybeans
"colorscheme vividchalk
" https://github.com/jonathanfilip/vim-lucius/blob/master/colors/lucius.vim
"colorscheme lucius
"LuciusBlack

nnoremap ; :
let mapleader=","

set incsearch
set hlsearch
" case insensitive when lowercase
set ignorecase
set smartcase
nmap <silent> ,/ :nohlsearch<CR>

set cursorline

" CTRL-P
" let g:ctrlp_match_window = 'min:4,max:999'
" let g:ctrlp_max_files = 0
" let g:ctrlp_custom_ignore = '\vvendor|tmp|app/assets/images|build|node_modules|public/packs*|public/assets$'

" fzf
map <C-p> :Files<CR>
" map <C-s> :Snippets<CR>
" Search for references to current word.
nmap <C-[> :call fzf#vim#ag(expand('<cword>'))<kEnter>

" fzf-tags
" To override the default jump-to-tag binding:
nmap <C-]> <Plug>(fzf_tags)

" ultisnips
" set runtimepath+=~/.vim/plugged/UltiSnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vim-rspec
" https://github.com/thoughtbot/vim-rspec
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" vim-ruby
"let ruby_fold = 1
" ... using fastfold?
" let g:ruby_fold = 1
" let ruby_foldable_groups = 'if case %'

" Auto open all folds on buffer read.
au BufRead * normal zR

" Fix slow render on large ruby files.
" https://stackoverflow.com/a/38616348
augroup ft_rb
    au!
    " fix the SLOOOW syntax highlighting
    "au FileType ruby setlocal re=1 foldmethod=manual
    " Modified to enable folds. Slightly slower than manual.
    au FileType ruby setlocal re=1 foldmethod=syntax
augroup END

" Javascript
set foldmethod=syntax
let javaScript_fold=1

" rails-vim
"
" GitLab EE
let g:rails_projections = {
        \ "ee/app/models/ee/*.rb": {
        \   "test": [
        \     "ee/spec/models/ee/{}_spec.rb",
        \     "ee/spec/models/{}_spec.rb",
        \   ],
        \ },
        \ "ee/app/models/*.rb": {
        \   "test": [
        \     "ee/spec/models/{}_spec.rb",
        \   ],
        \ },
        \ "ee/spec/models/ee/*_spec.rb": {
        \   "alternate": [
        \     "ee/app/models/ee/{}.rb",
        \     "ee/app/models/{}.rb",
        \   ],
        \ },
        \ "ee/spec/models/*_spec.rb": {
        \   "alternate": [
        \     "ee/app/models/ee/{}.rb",
        \     "ee/app/models/{}.rb",
        \   ]
        \ },
        \ "ee/lib/ee/*.rb": {
        \   "test": [
        \     "ee/lib/ee/{}_spec.rb",
        \   ],
        \ },
        \ "ee/lib/*.rb": {
        \   "test": [
        \     "ee/lib/{}_spec.rb",
        \   ],
        \ },
        \ "ee/*": { "type": "ee" },
        \ "app/models/*.rb": {
        \   "alternate": "spec/models/{}_spec.rb",
        \   "related": "ee/app/models/ee/{}.rb",
        \   "type": "source"
        \ }}

"Toggle line numbers
nmap \l :setlocal number!<CR>
"Paste mode
nmap \o :set paste!<CR>
"Move up/down wrapped lines
nmap j gj
nmap k gk

set tags=tags

"configure set colorcolumn=72 when using vim for git commit
autocmd Filetype gitcommit setlocal colorcolumn=72

" Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Performance improvements?
set ttyfast
set lazyredraw

" Load project local config
" https://github-wiki-see.page/m/neovim/nvim-lspconfig/wiki/Project-local-settings
set exrc
