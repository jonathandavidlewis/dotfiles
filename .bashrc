#alias
alias dump="cat -n"
alias ls="ls -lA"

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
##source private includes
for file in ~/.bashrc_includes/*; do
  source $file
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/andrewbillings/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/andrewbillings/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/andrewbillings/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/andrewbillings/google-cloud-sdk/completion.bash.inc'
fi

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

###exprot default android platform-tools dir to $PATH
if [ -d "/Users/andrewbillings/Library/Android/sdk/platform-tools" ] ; then
  export PATH="/Users/andrewbillings/Library/Android/sdk/platform-tools:$PATH"
fi

#source ~/.bash_profile
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
