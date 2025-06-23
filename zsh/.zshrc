# -- Aliases --

# Use ".." instead of "cd .."
alias ..="cd .."

# Use eza as ls
alias ls="eza -laG"
alias ll="eza -laH"

# Shorten fastfetch command
alias ff="fastfetch"

# -- Variables --
export PATH="$HOME/.local/bin:$PATH"

# -- Prompt --

# Only last two folders show
PROMPT='%B%F{10}%2~ %f%b%(!.#.>) '

fastfetch
