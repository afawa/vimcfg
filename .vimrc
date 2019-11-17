syntax on
set nu

set tabstop=4
set expandtab
set smarttab

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline'
Plugin 'zxqfl/tabnine-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-vdebug/vdebug'
call vundle#end()            " required
filetype plugin indent on    " required
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
"
"
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0 

" NERDTree config
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

set laststatus=2  "永远显示状态栏
let g:airline#extensions#tabline#enabled =1

map <C-k> :bn<CR>
map <C-j> :bN<CR>
map <C-l> :bp \| bd # <CR>

set smartindent
set shiftwidth=4

let g:indentLine_setColors = 0

"set autochdir

let g:gitgutter_max_signs = 500 
set updatetime=100

:inoremap <c-n><c-m> <esc>
map <c-m><c-n> :w<CR>
map <c-c> :packadd termdebug<CR>
