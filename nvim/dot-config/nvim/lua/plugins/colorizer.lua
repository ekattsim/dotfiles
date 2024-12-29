return {
	"norcalli/nvim-colorizer.lua",
	ft = { "css", "html", "javascriptreact" },
	config = function()
		require("colorizer").setup()

		local web_augroup = vim.api.nvim_create_augroup("WebGroup", { clear = true })
		vim.api.nvim_create_autocmd({ "BufRead" }, {
			group = web_augroup,
			pattern = { "*.html", "*.css", "*.jsx" },
			callback = function()
				vim.cmd("ColorizerAttachToBuffer")
			end,
		})
	end,
}
