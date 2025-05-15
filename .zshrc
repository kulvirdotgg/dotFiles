# ---- Aliases ----
alias ls='lsd'
alias lg='lazygit'
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

export EDITOR="nvim"
export MANPAGER="nvim +Man!"
