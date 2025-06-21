# ~/.bashrc: executed by bash(1) for non-login shells.

# ------------------------------------------------------------------------------
# 🧱 Base system and shell behavior
# ------------------------------------------------------------------------------

# Exit the shell if it's not interactive
case $- in
    *i*) ;;
      *) return;;
esac

# Avoid duplicate entries or those starting with a space in the history
HISTCONTROL=ignoreboth
shopt -s histappend             # Append to the history file instead of overwriting it
HISTSIZE=1000
HISTFILESIZE=2000

# Automatically update terminal dimensions after each command
shopt -s checkwinsize

# Improve support for non-text files with less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ------------------------------------------------------------------------------
# 🎨 Colors and Appearance
# ------------------------------------------------------------------------------

# Enable color support for ls, grep, etc.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# ------------------------------------------------------------------------------
# 🐙 Git prompt (Shows the current branch in the prompt)
# ------------------------------------------------------------------------------

# Aquarium palette colors
DARKBLUE="\[\e[38;5;25m\]"
LIGHTBLUE="\[\e[38;5;38m\]"
CYAN="\[\e[38;5;44m\]"
SEA_GREEN="\[\e[38;5;80m\]"
SKY_BLUE="\[\e[38;5;117m\]"
LIGHTGRAY="\[\e[38;5;250m\]"
RESET="\[\e[0m\]"

# Função para pegar branch Git
parse_git_branch(){ 
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Prompt Aquarium
PS1="${DARKBLUE} ${LIGHTBLUE}\u${CYAN}@${SEA_GREEN}\h ${SKY_BLUE}\w${SKY_BLUE} \$(parse_git_branch)${RESET}\n❯ "

# ------------------------------------------------------------------------------
# 🔧 Personal Configurations
# ------------------------------------------------------------------------------

# Default editor
export EDITOR=vim
export VISUAL=vim

# Alert for long-running commands (useful in terminal tabs)
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \
"$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Load aliases if defined
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

eval "$(starship init bash)"
