# -- Aliases --

# Use ".." instead of "cd .."
alias ..="cd .."

# -- Prompt --

# Only last two folders show
PROMPT='%B%F{10}%2~ %f%b%(!.#.>) '

# Setup nnn as file manager
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'
# export NNN_TERMINAL="foot"

# Open tmux on foot start
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi
