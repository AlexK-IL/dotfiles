#!/bin/bash
SESSION_NAME=my-session

function has-session {
	tmux has-session -t $SESSION_NAME 2>/dev/null
}

if has-session ; then
	tmux attach -t $SESSION_NAME
else
	tmux new-session  -s $SESSION_NAME -d
	tmux new-window  -t $SESSION_NAME -n ranger -d ranger
	tmux new-window  -t $SESSION_NAME -n torrent -d transmission-remote-cli
	tmux attach -t $SESSION_NAME
fi
