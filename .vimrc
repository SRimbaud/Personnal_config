set nocompatible

"runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let vundle manage vundle

Plugin 'VundleVim/Vundle.vim'

" List plugin here
"
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'gkjgh/cobalt'
Plugin 'carakan/new-railscasts-theme'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
"...


call vundle#end()
filetype plugin indent on
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"Let default coloscheme color for indentline (Bad with new railcast)
"let g:indentLine_setColors = 0

"--------- syntastic----------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_python_checkers = ['pylint', 'pep8', 'flake8',
      \'pyflakes', 'python']
"let g:syntastic_cpp_checkers = ['make', 'ninja', 'g++']
"let g:syntastic_c_checkers = ['make', 'ninja', 'gcc']

"----------- NerdTree ----------------
map <F3> :NERDTreeToggle<CR>

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

set colorcolumn=81
colorscheme new-railscasts
highlight ColorColumn ctermbg=DarkRed guibg=DarkRed
" Juste pour json

set tabstop =2
set shiftwidth =2
set softtabstop =2
set expandtab


