set nocp                " set nocompatible
set laststatus=2        " grey status bar at the bottom
syntax enable           " syntax highlighting
set ai                  " auto indenting
set nu                  " line numbers
set ic                  " case insensitive search
set scs                 " smart case search
set hlsearch 		    " highlight what you search for
set incsearch 		    " type-ahead-find
set expandtab		    " use spaces instead of tabs
set smarttab		    " be smart when using tabs
set shiftwidth=4	    " 1 tab input becomes 4 spaces
set tabstop=4		    " 1 tab read is interpreted as 8 spaces
set ru                  " shows ruler for cursor
set sc                  " showcmd shows incomplete commands
set foldmethod=syntax   " set a foldmethod
set foldnestmax=0
set splitright          " all vertical splits open to the right
set pastetoggle=<F10>   " paste mode messes up mappings
set textwidth=100

" let g:python3_host_prog = '/usr/bin/python3.8'

"remove all scroll bars
set guioptions-=r
set guioptions-=L

" slash-slash to search for visual selection h/t
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnorem // y/<c-r>"<cr>

" easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" No arrow keys allowed
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" But I like navigating in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Remap ;w to escape in insert mode.
inoremap ;; ;<Esc>:w<Enter>
inoremap ;w <Esc>:w<Enter>
nnoremap ;w <Esc>:w<Enter>

let mapleader = "\<Space>"

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" ctags
nnoremap <leader>] :vsp <Enter>:exec("tag ".expand("<cword>"))<Enter>zz

" Search mappings: These will make it so that going to the next one in a search will center on the
" line it's found in.
map N Nzt
map n nzt

" Make it so there are always several lines visible above and below the cursor
set scrolloff=10

" remember things yanked in a special register, so we can delete at will without concerns
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P

" print in insert mode
inoremap <C-t> <C-o>"0P
inoremap <C-T> <C-o>"0p

" often I want to find the next _
onoremap W f_
nnoremap W f_l
onoremap E t_
nnoremap E lt_
onoremap B T_
nnoremap B hT_

" In my mind, p means parentheses
onoremap p i(

" Usually, when making the header file, I want to just copy the original file, and append a ; to the
" end of each declaration and delete the body of the (folded) function. This automatically does just
" that to all code below the cursor
nnoremap <leader>h :,$g/^ \\|^}\\|^error\\|^\/\//d<CR>
nnoremap <leader>g :,$s/) {.*/);/g<CR>

" Make Y like D and every other cap command
nnoremap Y y$

" avoid pressing colon
nnoremap <leader>e <Esc>:e<space>
nnoremap <leader>v <Esc>:vsp<space>
nnoremap <leader>q <Esc>:q<CR>
nnoremap <leader>w <Esc>:w<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <C-g> o<Esc>

" Toggle folds!
nnoremap <leader>z za
nnoremap z<space> za


" Leader
vnoremap <Leader>y "+y         " Copy to system clipboard with leader + y

" Clear the highlighting
nnoremap <leader><Esc> <Esc>:noh<Enter>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Code Navigation
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kshenoy/vim-signature'

Plugin 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plugin 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}


" Git
"Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'

" Vim enhancements
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'tomtom/tcomment_vim'

" Man page navigation
" Plugin 'bruno-/vim-man'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/* ','right': ' */' } }
"let g:NERDCustomDelimiters = { 'cpp': { 'left': '/* ','right': ' */' } }

" Nerdcommenting hotkeys
nnoremap <Leader><Leader> :call nerdcommenter#Comment(0,"toggle")<Enter>
vnoremap <Leader><Leader> :call nerdcommenter#Comment(0,"toggle")<Enter>
nnoremap <Leader>r :call nerdcommenter#Comment(0,"uncomment")<Enter>
vnoremap <Leader>r :call nerdcommenter#Comment(0,"uncomment")<Enter>
nnoremap <Leader>s :call nerdcommenter#comment(0,"sexy")<Enter>
vnoremap <Leader>s :call nerdcommenter#comment(0,"sexy")<Enter>
nnoremap <Leader>i :call nerdcommenter#comment(0,"toggle")<Enter>
vnoremap <Leader>i :call nerdcommenter#comment(0,"toggle")<Enter>
"nnoremap <Leader>o o<Esc>:call nerdcommenter#comment(0,"sexy")<Enter>==la  <C-o>h
"vnoremap <Leader>o o<Esc>:call nerdcommenter#comment(0,"sexy")<Enter>==la  <C-o>h
nnoremap <Leader>o o<Esc>:call nerdcommenter#comment(0,"sexy")<Enter>==lla
vnoremap <Leader>o o<Esc>:call nerdcommenter#comment(0,"sexy")<Enter>==lla
"inoremap <C-c> <Esc>o<Esc>:call nerdcommenter#comment(0,"sexy")<Enter>kJ$hi  <C-o>h
inoremap <C-c> <Esc>o<Esc>:call nerdcommenter#comment(0,"sexy")<Enter>kJ$hhi


" Set up language-specific settings
au Filetype python setlocal tabstop=8		    " 1 tab read is interpreted as 8 spaces

" Pymode linters
let g:pymode_lint_checkers = ['flake8']

source ~/.config/nvim/cscope_maps.vim
set csre

set tags=./tags,./../tags,./../../tags,./../../../tags,tags

let g:coq_settings = { 'auto_start': 'shut-up' }

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
