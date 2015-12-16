#alias
alias dump="cat -n"
alias ls="ls -lA"
alias git="hub"
#functions
enterTheMatrix(){
  theMatrix(){
    echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
  }
  idletime(){
    /usr/sbin/ioreg -c IOHIDSystem | /usr/bin/awk '/HIDIdleTime/ {print int($NF/1000000000); exit}'
  }
  while [ 1 ];
  do
    if [ `idletime` -gt 0 ];
    then
      theMatrix;
    fi
    sleep 1
  done
}
# colors
[ -z "$TMUX" ] && export TERM=xterm-256color

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

# Include external files
for file in ~/.bashrc_includes/*; do
  source $file
done


# tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

### Default ps1 with colors:
### user@host path$
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
# PS1="$(tput setaf 2)[~\W$(tput setaf 7)\]\$(__git_ps1)$(tput setaf 2)]$ "
PS1='\T[\W/\[\033[0;37m\]$(__git_ps1 " (%s)")\[\033[0;12m\]]\$ '

enterTheMatrix;

#source ~/.bash_profile
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
