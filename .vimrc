syntax on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
set clipboard+=unnamed
set backspace=indent,eol,start

"settings for indentLine
set list lcs=tab:\|\ 

"--------------------------
" Start Neobundle Settings.
"--------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobudle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" ここに追加のプラグインを書く
" Neobundle 'plugin path on github'
" NeoBundle 'Yggdroot/indentLine'
NeoBundle "tyru/caw.vim.git"
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)

"--- MarkDown ---
"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a chromium'
"----------------

"--- Rust ---
NeoBundle 'rust-lang/rust.vim'
"------------

NeoBundle 'taichouchou2/vim-javascript'

call neobundle#end()

" Required:
filetype plugin indent on

"------------------------
" End Neobundle Settings.
"------------------------
