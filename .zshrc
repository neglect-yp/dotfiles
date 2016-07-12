# 補完
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u

alias g++='g++ -std=c++11'
alias emacs='vim'
alias objdump='gobjdump'
alias readelf='greadelf'
alias rm='rm -i'
alias today='date "+%Y%m%d"'

PATH="$PATH":/sbin
PATH="$PATH":/usr/sbin
PATH="$PATH":/usr/local/Cellar
PATH="$PATH":/Applications/sage

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
