# Personal aliases
alias ra='ranger'

# 🧰 Basic ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'      # Long listing with file types
alias la='ls -A'        # Show hidden files, but not . and ..
alias l='ls -CF'        # Classify entries and append indicators

# 🔍 Grep with colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# 🚨 Alerts for long commands (use: sleep 10; alert)
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \
"$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# 🌐 Networking shortcuts
alias ports='netstat -tulanp'
alias ipinfo='ip -c a'

# 📁 Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 🛠️ CLI Applications
vim() {                     # Use Neovim when typing 'vim'
    nvim "$@"
}
alias vimreal='/usr/bin/vim'  # Access real Vim if needed

alias ra='ranger'           # Terminal file manager
alias bt='btop'             # System resource monitor
alias nc='ncdu'             # Disk usage analyzer
alias h='htop'              # Process viewer
