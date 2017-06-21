# prompt
autoload -Uz colors
PROMPT='%K{black}%F{green}%n@%m %~%f%k
$ '

# completion
autoload -Uz compinit
compinit -u

# history
SAVEHIST=100
HISTFILE=~/.zsh_history

# alias
alias rm='rm -i'
alias today='date "+%Y%m%d"'

setopt ignore_eof
setopt auto_cd

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

