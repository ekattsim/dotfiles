return {
	"echasnovski/mini.nvim",
	version = false,
	event = "InsertEnter",
	enabled = true,
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		})

		require("mini.pairs").setup({
			mappings = {
				["<"] = { action = "open", pair = "<>", neigh_pattern = "\r.", register = { cr = false } },

				[">"] = { action = "close", pair = "<>", register = { cr = false } },
			},
		})

		-- disabling () pair in latex
		if vim.bo.filetype == "tex" then
			vim.keymap.set("i", "(", "(", { buffer = true })
			vim.keymap.set("i", "[", "[", { buffer = true })
		end

		local clear_mini_maps = vim.api.nvim_create_augroup("MiniUnmap", {})
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			group = clear_mini_maps,
			pattern = { "*.tex" },
			callback = function()
				vim.keymap.set("i", "(", "(", { buffer = true })
				vim.keymap.set("i", "[", "[", { buffer = true })
			end,
		})
	end,

	keys = {
		{
			"gsa",
			function()
				require("mini.surround").add()
			end,
			desc = "Add surrounding",
		},
		{
			"gsd",
			function()
				require("mini.surround").delete()
			end,
			desc = "Delete surrounding",
		},
		{
			"gsr",
			function()
				require("mini.surround").replace()
			end,
			desc = "Replace surrounding",
		},
	},
}
