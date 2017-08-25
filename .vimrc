syntax on
set autoindent
set smartindent
set number
set clipboard+=unnamed
set backspace=indent,eol,start
set mouse=a
set splitbelow
inoremap jk <Esc>

" vim-plug
if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug',
            \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'cohama/lexima.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
filetype plugin indent on
call plug#end()

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
