# Private .bashrc file for user burger
# PATH modification

if [[ -d ~/.local/bin ]]
then
export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d /usr/local/go/bin ]]
then
export PATH="$PATH:/usr/local/go/bin"
# export GOROOT="/usr/local/go"
fi

if [[ -f ~/.pythonpath ]]
then
export PYTHONPATH=`bash ~/.pythonpath`
fi

if [[ -d "$HOME/go" ]]
then
export GOPATH="$HOME/go"
fi

if [[ -f ~/.ldpath ]]
then
export LD_LIBRARY_PATH=`bash ~/.ldpath`
fi

if [[ -f ~/.llpath ]]
then
export CPLUS_INCLUDE_PATH=`bash ~/.llpath`
fi

if which opam >/dev/null 2>/dev/null
then
  eval `opam config env`
fi

export SSH_AUTH_SOCK="~/.ssh/agent"

# aliases

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la'
alias l='ll'
alias egrep='grep -E'
alias fgrep='grep -F'
alias R='R -q --vanilla'
alias octave='octave -q'


# Environment
export GIT_PAGER=most
export GIT_EDITOR=vim 

export EDITOR=vim
export PAGER=most

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Misc

export DO_NOT_TRACK=1


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

###############################
#            PROMPT           #
# If non-zero, print the last command's return value
PROMPT_COMMAND="export prompt_ans=\$?"

function _prompt_print_return()
{
    if [[ ! -z $1 && $1 != 0 ]]
    then
        echo -n "[$1]"
    fi
}

# If non-zero, print the number of currently running jobs
function _prompt_print_jobs()
{
    local j=$(jobs | wc -l | awk '{ print $1 }')

    if [ "$j" -ne 0 ]
    then
        echo -n "{$j}"
    fi
}

# Set the prompt color depending on the user's root-ness
function _prompt_color()
{
    if [ $EUID -eq 0 ]
    then
        color=31
    else
        color=32
    fi

    echo -e -n "\033[1;${color}m"
}

export PS1="\[\$(_prompt_color)\]\u@\h\[\033[1;34m\]:\w \[\033[1;36m\]\$(_prompt_print_jobs)\[\033[1;31m\]\$(_prompt_print_return \$prompt_ans)\[\033[1;34m\]\n\$\[\033[00m\] "

export PS2="\[\033[1;34m\]>\[\033[00m\] "
export PS3="\[\033[1;34m\]#?\[\033[00m\] "
export PS4="\[\033[1;34m\][\${LINENO}]+\[\033[00m\] "


#         END PROMPT         #
##############################


# enable bash completion in interactive shells
brew_etc="$(brew --prefix)/etc" && [[ -r "${brew_etc}/profile.d/bash_completion.sh" ]] && . "${brew_etc}/profile.d/bash_completion.sh"


. "$HOME/.cargo/env"
