local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/toggleterm.nvim")
-- vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lf.nvim")

require("config.globals")
require("config.keymaps")
require("config.options")

-- loading lf.nvim if a directory is the arg else lazy loading
-- if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
-- 	require("toggleterm").setup()
--
-- 	vim.g.lf_netrw = 1
--
-- 	require("lf").setup({
-- 		border = "rounded",
-- 		escape_quit = true,
-- 	})
--
-- 	vim.api.nvim_create_autocmd({ "User" }, {
-- 		pattern = "LfTermEnter",
-- 		callback = function(a)
-- 			vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
-- 		end,
-- 	})
--
--   vim.g.lf_load = false
-- end

local opts = {
	defaults = {
		lazy = true,
	},
	checker = {
		notify = true,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	rocks = {
		hererocks = true,
	},
}

require("lazy").setup("plugins", opts)

require("config.autocommands")
