return {
	"nvim-neorg/neorg",
	lazy = true,
	version = "*",
	ft = "norg",
	event = "VeryLazy",
	enabled = true,
	config = function()
		local neorg = require("neorg")

		neorg.setup({
			load = {
				["core.defaults"] = {
					config = {
						disable = {
							"core.journal",
							-- "core.qol.toc",
							-- "core.qol.todo_items",
							-- "core.todo-introspector",
							"core.ui.calendar",
						},
					},
				},
				["core.concealer"] = {
					config = {
						folds = true,
						icon_preset = "basic",
						-- init_open_folds = "never",
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							zettelkasten = "~/zettelkasten",
						},
						index = "todo.norg",
					},
				},
				["core.qol.todo_items"] = {
					config = {
						order = {
							{ "undone", " " },
							{ "pending", "-" },
							{ "done", "x" },
						},
					},
				},
				["core.esupports.metagen"] = {
					config = {
						type = "auto",
						timezone = "implicit-local",
						update_date = false,
						template = {
							{ "created" },
							{ "title" },
							{ "tags", "" },
						},
					},
				},
				["core.integrations.telescope"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
				-- ["core.integrations.image"] = {},
				-- ["core.latex.renderer"] = {},
			},
		})

		-- new zettel
		local dirman = neorg.modules.get_module("core.dirman")
		local ui = neorg.modules.get_module("core.ui")

		local new_zettel = function()
			ui.create_prompt("NeorgNewZettel", "New Zettel: ", function(text)
				-- Create the file that the user has entered
				dirman.create_file(text, "zettelkasten")
				dirman.set_workspace("zettelkasten")
			end, {
				center_x = true,
				center_y = true,
			}, {
				width = 25,
				height = 1,
				row = 10,
				col = 0,
			})
		end

		vim.keymap.set("n", "<leader>an", function()
			new_zettel()
		end, { desc = "create zettel" })
	end,
	keys = {
		{ "<leader>ak", "<Cmd>Neorg workspace zettelkasten<CR>", { desc = "open todo" } },
		{ "<leader>aj", "<Cmd>Telescope neorg find_norg_files<CR>", { desc = "find zettel" } },
		{ "<leader>an" },
		{ "<A-o>", "<Cmd>Neorg return<CR>", { desc = "Return to default workspace" } },
	},
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
}
