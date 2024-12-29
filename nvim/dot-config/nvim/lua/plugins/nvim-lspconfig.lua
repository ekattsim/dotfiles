local diagnostic_signs = require("util.lsp").diagnostic_signs
local on_attach = require("util.lsp").on_attach
local capabilities = require("util.lsp").capabilities

local config = function()
	local lspconfig = require("lspconfig")

	-- Diagnostics symbols
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- lua_ls setup with settings
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
					enable = true,
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- clangd_flags
	local clangd_cmd = { "clangd", "--offset-encoding=utf-16" }
	if vim.fn.getcwd() == "/Users/abhijeetsurakanti/CS/CP" then
		clangd_cmd[3] = "-header-insertion=never"
	end

	-- clangd setup
	lspconfig.clangd.setup({
		cmd = clangd_cmd,
		single_file_support = true,
		capabilities = capabilities,
		filetypes = {
			"cpp",
		},
		on_attach = function(client, bufnr)
			-- Toggle between header and source file
			vim.keymap.set(
				"n",
				"<leader>h",
				"<Cmd>ClangdSwitchSourceHeader<CR>",
				{ noremap = true, silent = true, buffer = bufnr, desc = "Toggle Header File" }
			)

			-- Go to implementation: finish sometime

			on_attach(client, bufnr)
		end,
	})

	-- python lsp setup
	require("lspconfig").pylsp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			pylsp = {
				configurationSources = {},
				plugins = {
					pycodestyle = {
						enabled = false,
					},
					mccabe = {
						enabled = false,
					},
					pyflakes = {
						enabled = false,
					},
				},
			},
		},
	})

	-- bash lsp setup
	lspconfig.bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"tmux",
			"sh",
		},
	})

	-- jsonls setup
	lspconfig.jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	-- javascript/typescript setup
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.html.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"html",
			"javascriptreact",
			"javascript",
		},
		settings = {
			html = {
				format = {
					enable = false,
				},
			},
		},
	})

	lspconfig.cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"css",
			"html",
			-- "javascript",
			"javascriptreact",
		},
	})

	-- -- grammar for markdown
	-- lspconfig.ltex.setup({
	-- 	on_attach = on_attach,
	-- 	capabilities = capabilities,
	-- 	filetypes = {
	-- 		"markdown",
	-- 		"tex",
	-- 	},
	-- 	single_file_support = true,
	-- })

	lspconfig.matlab_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			MATLAB = {
				installPath = "/Applications/MATLAB_R2024b.app",
			},
		},
	})

	-- lspconfig.vhdl_ls.setup({
	-- 	on_attach = on_attach,
	-- 	capabilities = capabilities,
	-- 	-- name = "vhdl_ls",
	-- 	-- cmd = { "vhdl_ls" },
	-- })

	-- local shellcheck = require("efmls-configs.linters.shellcheck")
	local eslint = require("efmls-configs.linters.eslint")
	local flake8 = require("efmls-configs.linters.flake8")
	flake8.lintCommand = flake8.lintCommand .. "-max-line-length 94 -"
	-- local luacheck = require("efmls-configs.linters.luacheck")
	-- luacheck.lintCommand = luacheck.lintCommand .. "-globals vim -"

	-- Formatters
	local clang_format = require("efmls-configs.formatters.clang_format")
	local command = clang_format.formatCommand
	clang_format.formatCommand = string.sub(command, 1, string.find(command, " "))
		.. '--style="{IndentWidth: 4}" '
		.. "'${INPUT}'"

	local stylua = require("efmls-configs.formatters.stylua")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local prettier = require("efmls-configs.formatters.prettier")

	local yapf = require("efmls-configs.formatters.yapf")
	yapf.formatCommand = yapf.formatCommand .. " --style='/Users/abhijeetsurakanti/ARCT/.style.yapf'"

	local languages = {
		lua = { stylua },
		cpp = { clang_format },
		sh = { shfmt },
		javascript = { prettier, eslint },
		javascriptreact = { prettier, eslint },
		html = { prettier },
		css = { prettier },
		python = { flake8, yapf },
	}

	lspconfig.efm.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = vim.tbl_keys(languages),
		settings = {
			languages = languages,
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = true,
	-- event = "VeryLazy",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "creativenull/efmls-configs-nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		-- { "antosha417/nvim-lsp-file-operations", config = true },
	},
	enabled = true,
}
