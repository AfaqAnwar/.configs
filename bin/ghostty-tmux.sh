set -euo pipefail

SESSION_NAME="${GHOSTTY_TMUX_SESSION:-ghostty}"

if TMUX_BIN="$(command -v tmux 2>/dev/null)"; then
  :
elif [[ -x /opt/homebrew/bin/tmux ]]; then
  TMUX_BIN="/opt/homebrew/bin/tmux"
elif [[ -x /usr/local/bin/tmux ]]; then
  TMUX_BIN="/usr/local/bin/tmux"
else
  echo "tmux not found. Install with: brew install tmux" >&2
  exit 127
fi

if [[ -n "${TMUX-}" ]]; then
  exec "$TMUX_BIN" switch-client -t "$SESSION_NAME" \
    || exec "$TMUX_BIN" new-session -As "$SESSION_NAME"
fi

exec "$TMUX_BIN" -u new-session -As "$SESSION_NAME"
