local M = {}

M.run_on_tty =
	"ttyecho -n $(tmux list-panes -F '\\#{pane_index}= \\#{pane_tty}' | rg \"$(tmux list-panes | rg -v '(active)' | cut -c1)=\" | rg -o '/dev/.*') \"$(echo -e '\\ei./exe')\""

return M
