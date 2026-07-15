# Start or attach to the main tmux session for interactive shells.
# This file is safe to source from both Bash and Zsh.
if [[ $- == *i* ]] && command -v tmux >/dev/null 2>&1 && [[ -z "${TMUX:-}" ]]; then
  tmux new-session -A -s main
fi
