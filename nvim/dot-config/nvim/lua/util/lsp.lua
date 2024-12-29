local M = {}
local keymap = vim.keymap

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", vim.tbl_extend("force", opts, { desc = "Hover Docs" }))

	-- Diagnostics
	keymap.set(
		"n",
		"<leader>dn",
		"<Cmd>Lspsaga diagnostic_jump_next<CR>",
		vim.tbl_extend("force", opts, { desc = "Next Diagnostic" })
	)
	keymap.set(
		"n",
		"<leader>dp",
		"<Cmd>Lspsaga diagnostic_jump_prev<CR>",
		vim.tbl_extend("force", opts, { desc = "Prev Diagnostic" })
	)
	keymap.set(
		"n",
		"<leader>dl",
		"<Cmd>Lspsaga show_line_diagnostics<CR>",
		vim.tbl_extend("force", opts, { desc = "Line Diagnostics" })
	)

	keymap.set("n", "<leader>dd", function()
		local diagnostics = vim.diagnostic.get(bufnr)
		local qf_items = vim.diagnostic.toqflist(diagnostics)

		vim.fn.setqflist(qf_items)
		vim.cmd.copen()
	end, vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics" }))

	keymap.set("n", "<leader>dD", function()
		vim.diagnostic.setqflist()
	end, vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics" }))

	-- Format File
	keymap.set("n", "<leader>ff", function()
		local efm = vim.lsp.get_clients({ name = "efm", bufnr = vim.fn.bufnr() })

		if not vim.tbl_isempty(efm) then
			vim.lsp.buf.format({
				name = "efm",
				async = false,
			})
		end
	end, vim.tbl_extend("force", opts, { desc = "Format File" }))

	-- Code Actions
	keymap.set(
		"n",
		"<leader>cA",
		"$<Cmd>Lspsaga code_action<CR>",
		vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics" })
	)

	-- Definitions
	keymap.set(
		"n",
		"gD",
		"<Cmd>Lspsaga peek_definition<CR>",
		vim.tbl_extend("force", opts, { desc = "Peek definition" })
	)
	keymap.set(
		"n",
		"gd",
		"<Cmd>Lspsaga goto_definition<CR>",
		vim.tbl_extend("force", opts, { desc = "Goto Definition" })
	)
	keymap.set(
		"n",
		"gt",
		"<Cmd>Lspsaga peek_type_definition<CR>",
		vim.tbl_extend("force", opts, { desc = "Peek Type Definition" })
	)
	keymap.set(
		"n",
		"gT",
		"<Cmd>Lspsaga goto_type_definition<CR>",
		vim.tbl_extend("force", opts, { desc = "Goto Type Definition" })
	)

	-- Telescope References and Symbols
	keymap.set(
		"n",
		"<leader>rr",
		"<Cmd>Telescope lsp_references theme=dropdown<CR>",
		vim.tbl_extend("force", opts, { desc = "Find References" })
	)
	keymap.set(
		"n",
		"<leader>fs",
		"<Cmd>Telescope lsp_workspace_symbols theme=dropdown<CR>",
		vim.tbl_extend("force", opts, { desc = "Find All Symbols" })
	)

	-- Lsp Rename
	keymap.set("n", "<leader>re", "<Cmd>Lspsaga rename<CR>", vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "󰻸", Info = "" }

return M
