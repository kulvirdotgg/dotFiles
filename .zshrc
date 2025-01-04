# ---- homebrew ----
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- Git Aliases ----
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gpsh='git push'
alias gs='git status'

alias ls='lsd'
alias nv='nvim'
alias neofetch="fastfetch"
alias python='python3'

# ---- Air GO hot reload ----
alias air="~/go/bin/air"

# ---- starship ----
eval "$(starship init zsh)"

# ---- zoxide ----
eval "$(zoxide init --cmd cd zsh)"

# ---- fzf ----
source <(fzf --zsh)
