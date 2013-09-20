#########################################
#ochiai's

#gem bundler
#export PATH=$PATH:/usr/local/rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/bundler-1.3.5/bin

#gem rails3.2.14
#export PATH=$PATH:/usr/local/rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/railties-3.2.14/lib

#rbenv
export RBENV_ROOT=/usr/local/rbenv/versions/2.0.0-p247
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

###########################################


alias ls='ls -G'

export PATH=/bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin:$PATH
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# Android
# ANDROID_HOME=/Users/ichiro/dev/adt-bundle-mac/sdk/
# export PATH=$ANDROID_HOME/tools:$PATH
# export PATH=$ANDROID_HOME/platform-tools:$PATH
# export PATH=/Users/dev/adt-bundle-mac/sdk:$PATH

# Emacs
alias em='/Applications/Emacs.app/Contents/MacOS/Emacs'

#export DYLD_FALLBACK_LIBRARY_PATH=/usr/lib


# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[magenta]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[magenta]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[magenta]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[magenta]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[magenta]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[magenta]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lla="ls -la"

alias du="du -h"
alias df="df -h"

alias su="su -l"


## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

## コンパイル用の環境変数
#export CC='cc'
#export CFLAGS='-fast -m64'
#export CXX='cc'
#export CXXFLAGS='-fast -m64'
#export CPPFLAGS="-I/usr/local/include \
#        -I/usr/local/ssl/include/openssl" 
#export LD_LIBRARY_PATH='/usr/local/lib'
#export LDFLAGS="-L/usr/local/lib -L/usr/lib" 

# rvm
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#if [ $SHLVL = 1 ];then
#screen
#fi

alias be="bundle exec"
alias knife='nocorrect knife'

eval "$(rbenv init - zsh)"
