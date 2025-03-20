# -- Aliases --

# Use ".." instead of "cd .."
alias ..="cd .."

# Use eza as ls
alias ls="eza -laG"

# Use zoxide as cd
alias cd="z"

# Shorten fastfetch command
alias ff="fastfetch"

# -- Prompt --

# Only last two folders show
PROMPT='%B%F{10}%2~ %f%b%(!.#.>) '

# -- Applications --
eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

fastfetch
