vim.keymap.set("n", "<leader><leader>", function()
	local run_on_tty =
		"ttyecho -n $(tmux list-panes -F '\\#{pane_index}= \\#{pane_tty}' | rg \"$(tmux list-panes | rg -v '(active)' | cut -c1)=\" | rg -o '/dev/.*') node %"
	vim.fn.jobstart(run_on_tty)
end, {
	noremap = true,
	silent = true,
	buffer = true,
})
