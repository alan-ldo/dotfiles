# ~/.bashrc: executed by bash(1) for non-login shells.

# ------------------------------------------------------------------------------
# 🧱 Base system and shell behavior
# ------------------------------------------------------------------------------

# Exit the shell if it's not interactve
case $- in
    *i*) ;;
      *) return;;
esac

# Avoid duplicate entries or those start with a space in the history
HISTCONTROL=ignoreboth
shopt -s histappend             # Append to the history file instead of overwriting it
HISTSIZE=1000
HISTFILESIZE=2000

# Automatically update terminal dimensions after each command
shopt -s checkwinsize

# Improve support for non-text files with less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set blinking block cursor on terminal startup
echo -ne '\e[1 q'

# ------------------------------------------------------------------------------
# 🎨 Colors and Appereance
# ------------------------------------------------------------------------------

# Enable colors support for ls, grep, etc.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Set the terminal window title in xterm and similar terminals
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# ------------------------------------------------------------------------------
# 🐙 Git prompt (Shows the current branch in the prompt)
# ------------------------------------------------------------------------------

if [ -f /etc/bash_completion.d/git-prompt ]; then
  . /etc/bash_completion.d/git-prompt
fi

if type __git_ps1 &>/dev/null; then
  export PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\[\e[1;33m\]$(__git_ps1 " (%s)")\[\e[0m\]\$ '
else
  export PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '
fi

# ------------------------------------------------------------------------------
# 🔧 Personal Configurations
# ------------------------------------------------------------------------------

# Define the default text editor
export EDITOR=vim
export VISUAL=vim

# Alert alias for long-running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \
"$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Load personal alias definitions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# ------------------------------------------------------------------------------
# 🧠 Advanced autocompletion (bash-completion)
# ------------------------------------------------------------------------------

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
