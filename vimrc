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
set shiftwidth=4	    " 1 tab == 2 spaces
set tabstop=8		    " 1 tab == 2 spaces
set ru                  " shows ruler for cursor
set sc                  " showcmd shows incomplete commands
set foldmethod=syntax   " set a foldmethod
set foldnestmax=1
set splitright          " all vertical splits open to the right
set pastetoggle=<F10>   " paste mode messes up mappings

"remove all scroll bars
set guioptions-=r
set guioptions-=L

" slash-slash to search for visual selection
" h/t http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnorem // y/<c-r>"<cr>

" activates indenting for files
filetype plugin indent on

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

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Make it so there are always several lines visible above and below the cursor
set scrolloff=10

" remember things yanked in a special register, so we can delete at will
" without concerns
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

" Usually, when making the header file, I want to just copy the original file,
" and append a ; to the end of each declaration and delete the body of the
" (folded) function. This automatically does just that.
nnoremap <Leader>h A;<Esc>jddj

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
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Code Navigation
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'

" autocompletion / snippets
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " snippet library
Plug 'robgarbanati/rob-snippets' " personal snippet library

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Vim enhancements
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'

" Appearance
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'

" Man page navigation
Plug 'bruno-/vim-man'

" Language specific
Plug 'burnettk/vim-angular'
Plug 'evidens/vim-twig'
Plug 'klen/python-mode'
Plug 'fisadev/vim-isort'
Plug 'fatih/vim-go'
Plug 'saltstack/salt-vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sjl/vitality.vim'

call plug#end()

" Force 256 colors
set t_Co=256

" Base16 Appearance
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-default
set colorcolumn=100
set cursorline

" Nerdcommenting hotkeys
" Nerdcommenting
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

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

" Convert c code to headers
function DisplayName(name)
  echom "Hello!  My name is:"
  echom a:name
endfunction

",$g/^ .*\|^}\|^error/d
",$s/) {.*/);/g

set tags=./tags,./../tags,./../../tags,./../../../tags,tags
