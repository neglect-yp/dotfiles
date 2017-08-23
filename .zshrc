# prompt
function git_prompt_stash_count {
  local COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
  if [ "$COUNT" -gt 0 ]; then
    echo "($COUNT) "
  fi
}

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info; RPROMPT="`git_prompt_stash_count`${vcs_info_msg_0_}" }
PROMPT="%K{green}%F{black}${MY_PROMPT:-%n@%m %~}%f%k
$ "

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

# --- vi mode ---
bindkey -v
autoload -Uz colors; colors
autoload -Uz add-zsh-hook
autoload -Uz terminfo
autoload -Uz is-at-least

function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        main|viins)
            tmux set -g status-left "-- INSERT -- | "
            ;;
        vicmd)
            tmux set -g status-left "-- NORMAL -- | "
            ;;
        vivis|vivli)
            tmux set -g status-left "-- VISUAL -- | "
            ;;
    esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

# Helper function
# use 'zle -la' option
# zsh -la option returns true if the widget exists
has_widgets() {
    if [[ -z $1 ]]; then
        return 1
    fi
    zle -la "$1"
    return $?
}

# Helper function
# use bindkey -l
has_keymap() {
    if [[ -z $1 ]]; then
        return 1
    fi
    bindkey -l "$1" >/dev/null 2>&1
    return $?
}

# Easy to escape
bindkey -M viins 'jk'  vi-cmd-mode
has_keymap "vivis" && bindkey -M vivis 'jk' vi-visual-exit

# Merge emacs mode to viins mode
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

# Make more vim-like behaviors
bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd 'G'  end-of-line

# User-defined widgets
peco-select-history()
{
    # Check if peco is installed
    if type "peco" >/dev/null 2>&1; then
        # BUFFER is editing buffer contents string
        BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
        # CURSOR is your key cursor position integer
        CURSOR=${#BUFFER}

        # just run
        zle accept-line
        # clear displat
        zle clear-screen
    else
        if is-at-least 4.3.9; then
            # Check if history-incremental-pattern-search-forward is available
            has_widgets "history-incremental-pattern-search-backward" && bindkey "^r" history-incremental-pattern-search-backward
        else
            history-incremental-search-backward
        fi
    fi
}
# Regist shell function as widget
zle -N peco-select-history
# Assign keybind
bindkey '^r' peco-select-history

# Enter
do-enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return
    fi

    /bin/ls -F
    zle reset-prompt
}
zle -N do-enter
bindkey '^m' do-enter

# https://github.com/zsh-users/zsh-history-substring-search
has_widgets 'history-substring-search-up' &&
    bindkey -M emacs '^P' history-substring-search-up
has_widgets 'history-substring-search-down' &&
    bindkey -M emacs '^N' history-substring-search-down

has_widgets 'history-substring-search-up' &&
    bindkey -M viins '^P' history-substring-search-up
has_widgets 'history-substring-search-down' &&
    bindkey -M viins '^N' history-substring-search-down

has_widgets 'history-substring-search-up' &&
    bindkey -M vicmd 'k' history-substring-search-up
has_widgets 'history-substring-search-down' &&
    bindkey -M vicmd 'j' history-substring-search-down

if is-at-least 5.0.8; then
    autoload -Uz surround
    zle -N delete-surround surround
    zle -N change-surround surround
    zle -N add-surround surround

    bindkey -a cs change-surround
    bindkey -a ds delete-surround
    bindkey -a ys add-surround
    bindkey -a S add-surround
fi
# --- end vi mode ---

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "bobthecow/git-flow-completion", from:oh-my-zsh
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose
    
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

