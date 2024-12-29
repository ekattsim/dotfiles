-- Setting <Leader> to Space
vim.g.mapleader = " "
vim.g.maplocalleader = "<C-Space>"

-- Setting MaximizeToggle State
vim.g.toggleState = false
vim.g.toggleNoice = false

-- vim.g.lf_load = true

-- Command Creation:
local create_cmd = vim.api.nvim_create_user_command
-- MaximizeToggle command
local toggleFunction = require("util.MaximizeToggle")
create_cmd("MaximizeToggle", toggleFunction, { desc = "Toggles Maximize/Minimize" })

-- finally remapping this shi
create_cmd("W", "w", { desc = "save" })

-- Asynchronous Make
local async_make = require("util.async_make").async_make
create_cmd("Make", async_make, { desc = "Async Make" })

-- Luasnip useful function
get_capture = function(args, parent, user_args)
	if not user_args then
		return parent.captures[1]
	end
	return parent.captures[user_args]
end

-- creation time
vim.g.ctime = ""
