syntax on
set autoindent
set smartindent
set number
set clipboard+=unnamed
set backspace=indent,eol,start
set mouse=a
inoremap jk <Esc>

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
" 手軽にコメントアウト
NeoBundle "tyru/caw.vim.git"
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)

" editorconfigをvimで使えるようにする
NeoBundle 'editorconfig/editorconfig-vim'
"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" linuxコーディング規約
NeoBundle 'vivien/vim-linux-coding-style.git'

"----------------

call neobundle#end()

" Linux-coding-style
let g:linuxsty_patterns = [ "/usr/src/", "/linux", "/Users/Gen/syspro2016" ]

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a chromium'


" Required:
filetype plugin indent on

"------------------------
" End Neobundle Settings.
"------------------------
"
