#!/usr/bin/env sh

nohup wezterm start -- tmux attach -t "$1" >/dev/null 2>&1 &
