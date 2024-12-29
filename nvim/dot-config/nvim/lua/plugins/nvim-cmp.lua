---@diagnostic disable: missing-fields
local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	enabled = true,
	event = "InsertEnter",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()
		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			preselect = cmp.PreselectMode.None,

			window = {
				completion = {
					side_padding = 1,
					winhighlight = "Normal:CmpPmenu,CursorLine:DashboardShortcut,Search:PmenuSel",
					scrollbar = false,
					border = border("CmpDocBorder"),
				},
				documentation = {
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpDoc",
				},
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			view = {
				docs = {
					auto_open = false,
				},
			},

			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = function()
					if cmp.visible() then
						cmp.close()
					else
						cmp.complete()
					end
				end,
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<M-d>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if cmp.visible_docs() then
							cmp.close_docs()
						else
							cmp.open_docs()
						end
					else
						fallback()
					end
				end, { "i" }),
			}),

			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "neorg" },
			}, {
				{ name = "buffer", keyword_length = 3 },
			}),

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			sorting = defaults.sorting,
		}
	end,

	config = function(_, opts)
		require("cmp").setup(opts)
	end,
}
