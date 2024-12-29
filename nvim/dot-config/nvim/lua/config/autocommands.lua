local api = vim.api
local cwd = vim.fn.getcwd()
-- local makeprg = 'clang++ -std=c++11 -O2 -Wall "%" -o ' .. cwd .. "/exe"

local function dirToFileName(dir)
	local dirAsArray = {}
	for i = 1, #dir do
		dirAsArray[i] = dir:sub(i, i)
		if dirAsArray[i] == "/" then
			dirAsArray[i] = "_"
		end
	end

	local dirAsFileName = table.concat(dirAsArray)
	return dirAsFileName
end

local cwdAsFileName = dirToFileName(cwd)
local shadaPath = "/Users/abhijeetsurakanti/.local/state/nvim/shada/"
local shadaFilePath = shadaPath .. cwdAsFileName .. ".shada"

local vimEnter_id = api.nvim_create_augroup("VimEnterGroup", {
	clear = true,
})

local vimLeave_id = api.nvim_create_augroup("VimLeaveGroup", {
	clear = true,
})

-- load Global Marks of this Project
api.nvim_create_autocmd({ "VimEnter" }, {
	group = vimEnter_id,
	callback = function()
		if vim.fn.filereadable(shadaFilePath) ~= 1 then
			vim.cmd('!touch "' .. shadaFilePath .. '"')
		end
		vim.cmd("rshada! " .. shadaFilePath)
	end,
})

api.nvim_create_autocmd({ "VimLeave" }, {
	group = vimLeave_id,
	command = "wshada! " .. shadaFilePath,
})

-- local bufWinLeave_id = api.nvim_create_augroup("BufWinLeaveGroup", {
-- 	clear = true,
-- })

-- api.nvim_create_autocmd({ "BufWinLeave" }, {
-- 	group = bufWinLeave_id,
-- 	callback = require("util.marks").updateMark,
-- })

-- changing NonText Highlight group for the sake of EOL chars
vim.cmd("hi NonText guifg=bg")
vim.cmd("hi NoiceHiddenCursor guibg=#eb6f92")

local lspAttach_id = api.nvim_create_augroup("LspAttachGroup", {
	clear = true,
})

api.nvim_create_autocmd({ "LspAttach" }, {
	group = lspAttach_id,
	callback = function(ev)
		if vim.lsp.get_clients({ bufnr = ev.buf })[1]["name"] ~= "ltex" then
			vim.opt.laststatus = 0
			vim.cmd("set statusline=%{repeat('-',winwidth('.'))}")
		end
	end,
})

local bufRead_id = api.nvim_create_augroup("BufReadGroup", {
	clear = true,
})

api.nvim_create_autocmd({ "BufRead" }, {
	group = bufRead_id,
	pattern = { "*.txt", "*.tex", "*.h", "*.md", "*.norg" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

api.nvim_create_autocmd({ "BufRead" }, {
	group = bufRead_id,
	callback = function()
		vim.opt.formatoptions = "jtcql"
	end,
})

local bufEnter_id = api.nvim_create_augroup("BufEnterGroup", {
	clear = true,
})

api.nvim_create_autocmd({ "BufEnter" }, {
	group = bufEnter_id,
	callback = function(ev)
		local clients = vim.lsp.get_clients({ bufnr = ev.buf })
		if clients[1] == nil or clients[1]["name"] == "ltex" then
			vim.opt.laststatus = 2
			vim.cmd("set statusline&")
		else
			vim.opt.laststatus = 0
			vim.cmd("set statusline=%{repeat('-',winwidth('.'))}")
		end
	end,
})

-- Update makeprg when working with CP
api.nvim_create_autocmd({ "Bufenter" }, {
	group = bufEnter_id,
	pattern = { "/Users/abhijeetsurakanti/CS/CP/*.cpp" },
	callback = function(ev)
		vim.keymap.set(
			"i",
			"#begin",
			"#include <bits/stdc++.h><CR><CR>using namespace std;<CR><CR>int main (int argc, char *argv[]) {<CR>}<Esc>Oreturn 0;<Esc>2O<Esc>kcc",
			{
				noremap = true,
				silent = true,
				buffer = ev.buf,
			}
		)
	end,
})

-- format on save
local lsp_fmt_group = api.nvim_create_augroup("LspFormattingGroup", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function(ev)
		local efm = vim.lsp.get_clients({ name = "efm", bufnr = ev.buf })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({
			name = "efm",
			async = false,
		})
	end,
})

-- scrolloff set to mid (I'm a dumbass, or not)
local scrolloff_group = api.nvim_create_augroup("scrollOff", { clear = true })
api.nvim_create_autocmd({ "WinEnter", "WinResized", "VimEnter" }, {
	group = scrolloff_group,
	callback = function(ev)
		vim.opt.scrolloff = math.floor(vim.fn.winheight(0) / 2) + 1
	end,
})

-- setting syntax=matlab
api.nvim_create_autocmd({ "BufRead" }, {
	pattern = "*.m",
	callback = function(ev)
		vim.bo.syntax = "matlab"
	end,
})

local view_group = vim.api.nvim_create_augroup("auto_view", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
	desc = "Save view with mkview for real files",
	group = view_group,
	callback = function(args)
		if vim.b[args.buf].view_activated then
			vim.cmd.mkview({ mods = { emsg_silent = true } })
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "Try to load file view if available and enable view saving for real files",
	group = view_group,
	callback = function(args)
		if not vim.b[args.buf].view_activated then
			local loadFold = function()
				local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
				local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
				if
					buftype == ""
					and filetype
					and filetype ~= ""
					and not vim.tbl_contains(ignore_filetypes, filetype)
				then
					vim.b[args.buf].view_activated = true
					vim.cmd.loadview({ mods = { emsg_silent = true } })
				end
			end

			-- nvim or nvim other_file means we need to defer and give time to initialize.
			if vim.fn.argc() == 0 or vim.fn.argv(0) ~= vim.fn.expand("%") then
				vim.defer_fn(loadFold, 0)
			else
				loadFold()
			end
		end
	end,
})

-- saving file creation time (solved by backupcopy=yes)
-- local save_ctime_group = api.nvim_create_augroup("SavingCtimeGroup", { clear = true })
--[[ api.nvim_create_autocmd("BufWritePre", {
	group = save_ctime_group,
	callback = function(ev)
		local sysComplete = vim.system({ "GetFileInfo", "-d", vim.fn.expand("%") }):wait()
		print(vim.system({ "date", "+%s" }):wait().stdout)
		vim.g.ctime = sysComplete.stdout
	end,
})

api.nvim_create_autocmd("BufWritePost", {
	group = save_ctime_group,
	callback = function(ev)
		vim.system({ "SetFile", "-d", vim.g.ctime, vim.fn.expand("%") })
		print(vim.system({ "date", "+%s" }):wait().stdout)
	end,
}) ]]
