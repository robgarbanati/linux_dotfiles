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
set tabstop=8		    " 1 tab read is interpreted as 8 spaces
set ru                  " shows ruler for cursor
set sc                  " showcmd shows incomplete commands
set foldmethod=syntax   " set a foldmethod
set foldnestmax=1
set splitright          " all vertical splits open to the right
set pastetoggle=<F10>   " paste mode messes up mappings
set textwidth=100

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
map N Nzz
map n nzz

" Make it so there are always several lines visible above and below the cursor
set scrolloff=10

" remember things yanked in a special register, so we can delete at will without concerns
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P

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

" Bar cursor in insert mode
" gnome cursor shifting
au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-default-dark/cursor_shape ibeam"
au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-default-dark/cursor_shape block"
au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-default-dark/cursor_shape block"

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
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

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

" autocompletion / snippets
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets' " snippet library
"Plugin 'robgarbanati/rob-snippets' " personal snippet library

" Git
"Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'

" Vim enhancements
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'tomtom/tcomment_vim'

" Appearance
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'chriskempson/base16-vim'
"Plugin 'altercation/vim-colors-solarized'

" Man page navigation
Plugin 'bruno-/vim-man'

" Language specific
"Plugin 'burnettk/vim-angular'
"Plugin 'evidens/vim-twig'
"Plugin 'klen/python-mode'
"Plugin 'fisadev/vim-isort'
"Plugin 'fatih/vim-go'
"Plugin 'saltstack/salt-vim'

" tmux
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'tmux-plugins/vim-tmux-focus-events'
"Plugin 'sjl/vitality.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" Force 256 colors
"set t_Co=256

"" Base16 Appearance
"let base16colorspace=256  " Access colors present in 256 colorspace
"set background=dark
"colorscheme base16-default
"set colorcolumn=100
"set cursorline

" Nerdcommenting hotkeys
nnoremap <Leader><Leader> :call NERDComment(0,"toggle")<Enter>
vnoremap <Leader><Leader> :call NERDComment(0,"toggle")<Enter>
nnoremap <Leader>r :call NERDComment(0,"uncomment")<Enter>
vnoremap <Leader>r :call NERDComment(0,"uncomment")<Enter>
nnoremap <Leader>s :call NERDComment(0,"sexy")<Enter>
vnoremap <Leader>s :call NERDComment(0,"sexy")<Enter>
nnoremap <Leader>i :call NERDComment(0,"toggle")<Enter>
vnoremap <Leader>i :call NERDComment(0,"toggle")<Enter>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

let g:UltiSnipsSnippetDirectories=["Ultisnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YCM gotos
let g:ycm_always_populate_location_list = 1
nnoremap gh :YcmCompleter GoToDeclaration<CR>
nnoremap go :lnext<CR>
nnoremap gi :lprevious<CR>

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

" Prevent ycm from ever opening preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" point to .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = [ './.ycm_extra_conf.py']

" Set up language-specific settings
au Filetype python setlocal tabstop=8		    " 1 tab read is interpreted as 8 spaces

" Pymode linters
let g:pymode_lint_checkers = ['flake8']

source ~/.config/nvim/cscope_maps.vim

"set tags=./tags,./../tags,./../../tags,./../../../tags,tags
