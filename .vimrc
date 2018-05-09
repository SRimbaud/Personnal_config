set nocompatible

"runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let vundle manage vundle

Plugin 'VundleVim/Vundle.vim'

" List plugin here
"
Plugin 'nanotech/jellybeans.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
"...


call vundle#end()
filetype plugin indent on
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"Let default coloscheme color for indentline (Bad with new railcast)
"let g:indentLine_setColors = 0

"--------- LightLine ---------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"--------- syntastic----------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_python_checkers = ['pylint', 'flake8', 'pyflakes']
let g:syntastic_sh_checkers = ['sh', 'shellcheck']
let g:syntastic_cmake_checkers = ['cmakelint']
let g:syntastic_cpp_checkers = []
let g:syntastic_c_checkers = []

"----------- NerdTree ----------------
nnoremap <F3> :NERDTreeToggle<CR>

"Close vim if nerdtree is the only opened buff
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \&& b:NERDTree.isTabTree()) | q | endif
"----------- Status Line -------------
let laststatus = 2

"----------- Templates ---------------

if has("autocmd")
  augroup templates
    au!
    "~~~~~~~~ C lang ~~~~~~~~
    autocmd BufNewFile CMakeLists.txt, *.cmake 0r 
          \~/.vim/templates/skeleton.cmake
    autocmd BufNewFile main.cpp 0r ~/.vim/templates/skeleton.main.cpp
    autocmd BufNewFile main.c 0r ~/.vim/templates/skeleton.main.c
    autocmd BufNewFile *.h, *.hpp ~/.vim/templates/skeleton.hxx
    "~~~~~~~~ Python ~~~~~~~~~
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    "~~~~~~~~ Bash ~~~~~~~~~~~
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif
"----------- Highlight search --------
:set hlsearch " Search highlight
" Highlight all occurence of the current word
:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
"----------- Buffer Switch -----------
:nnoremap <C-h> :bprev <CR>
:nnoremap <C-l> :bnext <CR>
:nnoremap <F5> :sb 


"----------- Other -------------------

set number relativenumber
syn on
set syntax =on

set mouse =a
set showmatch

set incsearch

set wildmenu

set foldmethod =syntax

set spelllang =en,fr
set spell
set spellsuggest =5

set cursorline

if has('gui_running')
  set guifont=Monospace\ Bold\ 10 
endif
set colorcolumn=81
set t_Co=256
colorscheme jellybeans
highlight ColorColumn ctermbg=DarkRed guibg=DarkRed

set tabstop =2
set shiftwidth =2
set softtabstop =2
set expandtab


