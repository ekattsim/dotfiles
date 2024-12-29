return {
	"williamboman/mason.nvim",
	enabled = true,
	event = "VeryLazy",
	cmd = "Mason",
	build = ":MasonUpdate",
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
