# 🧰 Basic ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'      # Long listing with file types
alias la='ls -A'        # Show hidden files, but not . and ..
alias l='ls -CF'        # Classify entries and append indicators

# 🔍 Grep with colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# 🌐 Networking shortcuts
alias ports='netstat -tulanp'
alias ipinfo='ip -c a'

# 📁 Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 🛠️ CLI Applications
alias vimk='NVIM_APPNAME="nvim-kickstart" nvim' # Acces the neovim with folder nvim-kickstart configuration
alias vimc='NVIM_APPNAME="NvChad" nvim' # Acces the neovim with folder NvChad configuration

alias ra='ranger'           # Terminal file manager
alias bt='btop'             # System resource monitor
alias nc='ncdu'             # Disk usage analyzer
alias h='htop'              # Process viewer
