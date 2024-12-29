local opts = {
	ensure_installed = {
		"lua_ls",
		"efm",
		"jsonls",
		"clangd",
		"bashls",
		"ts_ls",
		"pylsp",
		"ltex",
		"matlab_ls",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "VeryLazy",
	-- event = { "BufReadPost", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	enabled = true,
}
