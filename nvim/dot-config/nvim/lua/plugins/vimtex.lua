return {
	"lervag/vimtex",
	ft = { "tex", "markdown" },
	enabled = true,
	init = function()
		vim.g.vimtex_imaps_enabled = 0
		vim.g.vimtex_complete_enabled = 0
		vim.g.vimtex_view_general_viewer = "zathura"
		vim.g.vimtex_indent_enabled = 1
		vim.g.vimtex_syntax_enabled = 0

		-- disable maps
		vim.g.vimtex_mappings_disable = {
			i = { "]]" },
		}
	end,
}
