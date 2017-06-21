syntax on
set autoindent
set smartindent
set number
set clipboard+=unnamed
set backspace=indent,eol,start
set mouse=a
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
filetype plugin indent on
call plug#end()
