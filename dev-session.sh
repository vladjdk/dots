#!/bin/zsh

SESSION="dev"

# Kill existing session if it exists
tmux kill-session -t $SESSION 2>/dev/null

# Window 1: Main workspace
tmux new-session -d -s $SESSION -n main

# Split right for lazygit
tmux split-window -h -t $SESSION:1
tmux send-keys -t $SESSION:1.2 'lazygit' Enter

# Go back to left, split bottom for terminal
tmux split-window -v -t $SESSION:1.1

# Start claude in top-left
tmux send-keys -t $SESSION:1.1 'claude' Enter

# Window 2: Neovim
tmux new-window -t $SESSION -n editor
tmux send-keys -t $SESSION:2 'nvim' Enter

# Window 3: 4 terminals (one in each corner)
tmux new-window -t $SESSION -n terminals
tmux split-window -h -t $SESSION:3
tmux split-window -v -t $SESSION:3.1
tmux split-window -v -t $SESSION:3.2
tmux select-layout -t $SESSION:3 tiled

# Start on window 1, top-left pane
tmux select-window -t $SESSION:1
tmux select-pane -t $SESSION:1.1

# Attach
tmux attach -t $SESSION
