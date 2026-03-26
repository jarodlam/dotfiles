#!/usr/bin/env bash
# source-remote-tmux-config.sh - Apply tmux keybindings to a remote tmux session
#
# Sends the contents of tmux-remote.conf into the current pane as a heredoc,
# writes it to a temp file on the remote, sources it with tmux, then cleans up.
#
# Usage: Bound to <prefix> S in tmux.conf

set -euo pipefail

REMOTE_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux-remote.conf"

if [[ ! -f "$REMOTE_CONF" ]]; then
    tmux display-message "Error: $REMOTE_CONF not found"
    exit 1
fi

REMOTE_TMP="/tmp/.tmux-remote.conf"
DELIMITER="__TMUX_REMOTE_EOF__"

# Step 1: Send heredoc that writes config to a temp file on the remote
tmux send-keys "cat <<'${DELIMITER}' > ${REMOTE_TMP}
$(cat "$REMOTE_CONF")
${DELIMITER}" Enter

# Step 2: Source the config and clean up
sleep 0.5
tmux send-keys "tmux source-file ${REMOTE_TMP} && rm -f ${REMOTE_TMP} && echo 'Remote tmux config applied.'" Enter
