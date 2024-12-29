local config = function()
	require("luasnip").setup({
		enable_autosnippets = true, -- Enables autosnippets
		store_selection_keys = "<Tab>", -- take and insert selected text into the snippet
		update_events = "TextChanged,TextChangedI", -- updates other relevant nodes on these events
		history = true,
		delete_check_events = "TextChanged",
	})
	-- vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
	-- vim.cmd("smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
	-- vim.cmd("imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'")
	-- vim.cmd("smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'")
end

return {
	"L3MON4D3/LuaSnip",
	version = "v2.3.0",
	config = config,
	build = "make install_jsregexp",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets/" })
			require("luasnip").filetype_extend("javascript", { "html" })
		end,
	},
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = { "i", "s" },
    },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
	enabled = true,
}
