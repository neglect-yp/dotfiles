syntax on
set number
set clipboard+=unnamed
set backspace=indent,eol,start

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

"--- MarkDown ---
"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a chromium'
"----------------

call neobundle#end()

" Required:
filetype plugin indent on

"------------------------
" End Neobundle Settings.
"------------------------
