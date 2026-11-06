# -----------------------------
# Aliases
# -----------------------------

alias python="python3"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias gac="git add . && git commit -m"
alias gs="git status"
alias gss="git status --short"
alias gb="git switch"
alias gbc="git switch -c"
alias gl="git log"
alias cl="claude"
alias zrc="source ~/.zshrc"

# -----------------------------
# NVM
# -----------------------------

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# -----------------------------
# Paths
# -----------------------------

export NARGO_HOME="$HOME/.nargo"

export PATH="$PATH:$NARGO_HOME/bin"
export PATH="$PATH:$HOME/.bb"
export PATH="$PATH:$HOME/.aztec/bin"

# -----------------------------
# Compiler Includes
# -----------------------------

export CPLUS_INCLUDE_PATH="/opt/homebrew/Cellar/boost/1.89.0/include:$CPLUS_INCLUDE_PATH"

# -----------------------------
# Prompt
# -----------------------------

autoload -Uz colors && colors

PROMPT='%F{172}%n%f %F{245}in %F{252}%~%f
%F{172}❯ %f'

# -----------------------------
# Startup
# -----------------------------

clear
echo ""
fastfetch
echo ""
export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/Users/uttkarsh/.spicetify
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
eval "$(zoxide init zsh)"

