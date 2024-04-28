#fortune | cowsay -f tux "ara ara kulvir kun"

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gd='git diff'
alias gpl='git pull'
alias gp='git push'
alias gs='git status'

alias python='python3'

alias nv='nvim'

# Air for GO hot reload
alias air="~/go/bin/air"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# cool to use tools (if ever wanted to)
alias neofetch="macchina"
# neofetch

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/kulvir/.bun/_bun" ] && source "/Users/kulvir/.bun/_bun"

eval "$(starship init bash)"
