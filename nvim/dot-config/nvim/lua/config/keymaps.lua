local keymap = vim.keymap

-- Generates OptsTable by taking in desc
local function optsTable(opts)
	local output = {}

	output.silent = true
	output.desc = opts.desc or "Desc Not Given"
	output.noremap = opts.noremap or true

	return output
end

-- Line Navigation
keymap.set({ "n", "v", "o" }, "H", "0", optsTable({ desc = "End of Line" }))
keymap.set({ "n", "v", "o" }, "L", "$", optsTable({ desc = "Beginning of Line" }))
keymap.set({ "n" }, "j", "gj")
keymap.set({ "n" }, "k", "gk")

-- Window Management
keymap.set({ "n" }, "<leader>|", ":vsplit<CR>", optsTable({ desc = "Vertical Split" }))
keymap.set({ "n" }, "<leader>-", ":split<CR>", optsTable({ desc = "Horizontal Split" }))
keymap.set({ "n" }, "<leader>m", ":MaximizeToggle<CR>", optsTable({ desc = "Toggle Maximize/Minimize" }))

-- Window Navigation
-- keymap.set({ "n", "i" }, "<C-h>", "<C-w>h<C-w>=<cmd>lua vim.g.toggleState=false<CR>")
-- keymap.set({ "n", "i" }, "<C-j>", "<C-w>j<C-w>=<cmd>lua vim.g.toggleState=false<CR>")
-- keymap.set({ "n", "i" }, "<C-k>", "<C-w>k<C-w>=<cmd>lua vim.g.toggleState=false<CR>")
-- keymap.set({ "n", "i" }, "<C-l>", "<C-w>l<C-w>=<cmd>lua vim.g.toggleState=false<CR>")

-- Select All
keymap.set({ "n", "i" }, "<A-a>", "<Esc>GVgg", optsTable({ desc = "select all" }))

-- Close buffer
keymap.set({ "n" }, "<leader>x", "<Cmd>bd<CR>", optsTable({ desc = "close buffer" }))

-- Visual Mode Indenting
keymap.set({ "v" }, ">", ">gv")
keymap.set({ "v" }, "<", "<gv")

-- Mapping nohl to esc
keymap.set({ "n" }, "<esc>", "<esc><CMD>noh<CR>", { noremap = false })

-- Mapping Lazy command
keymap.set("n", "<leader>l", "<CMD>Lazy<CR>")

-- Buffer Management
keymap.set("n", "<Tab>", "<Cmd>e #<CR>", optsTable({ desc = "go to previous bufffer" }))

-- Jumping to Marks using <Leader>
keymap.set("n", "<leader>A", "'A`\"zz", optsTable({ desc = "Mark A" }))
keymap.set("n", "<leader>B", "'B`\"zz", optsTable({ desc = "Mark B" }))
keymap.set("n", "<leader>C", "'C`\"zz", optsTable({ desc = "Mark C" }))
keymap.set("n", "<leader>D", "'D`\"zz", optsTable({ desc = "Mark D" }))
keymap.set("n", "<leader>E", "'E`\"zz", optsTable({ desc = "Mark E" }))
keymap.set("n", "<leader>F", "'F`\"zz", optsTable({ desc = "Mark F" }))
keymap.set("n", "<leader>G", "'G`\"zz", optsTable({ desc = "Mark G" }))
keymap.set("n", "<leader>H", "'H`\"zz", optsTable({ desc = "Mark H" }))
keymap.set("n", "<leader>I", "'I`\"zz", optsTable({ desc = "Mark I" }))
keymap.set("n", "<leader>J", "'J`\"zz", optsTable({ desc = "Mark J" }))
keymap.set("n", "<leader>K", "'K`\"zz", optsTable({ desc = "Mark K" }))
keymap.set("n", "<leader>L", "'L`\"zz", optsTable({ desc = "Mark L" }))
keymap.set("n", "<leader>M", "'M`\"zz", optsTable({ desc = "Mark M" }))
keymap.set("n", "<leader>N", "'N`\"zz", optsTable({ desc = "Mark N" }))
keymap.set("n", "<leader>O", "'O`\"zz", optsTable({ desc = "Mark O" }))
keymap.set("n", "<leader>P", "'P`\"zz", optsTable({ desc = "Mark P" }))
keymap.set("n", "<leader>Q", "'Q`\"zz", optsTable({ desc = "Mark Q" }))
keymap.set("n", "<leader>R", "'R`\"zz", optsTable({ desc = "Mark R" }))
keymap.set("n", "<leader>S", "'S`\"zz", optsTable({ desc = "Mark S" }))
keymap.set("n", "<leader>T", "'T`\"zz", optsTable({ desc = "Mark T" }))
keymap.set("n", "<leader>U", "'U`\"zz", optsTable({ desc = "Mark U" }))
keymap.set("n", "<leader>V", "'V`\"zz", optsTable({ desc = "Mark V" }))
keymap.set("n", "<leader>W", "'W`\"zz", optsTable({ desc = "Mark W" }))
keymap.set("n", "<leader>X", "'X`\"zz", optsTable({ desc = "Mark X" }))
keymap.set("n", "<leader>Y", "'Y`\"zz", optsTable({ desc = "Mark Y" }))
keymap.set("n", "<leader>Z", "'Z`\"zz", optsTable({ desc = "Mark Z" }))

-- Quickfix List And Localtion List
keymap.set("n", "<leader>j", "<Cmd>cn<CR>", optsTable({}))
keymap.set("n", "<leader>k", "<Cmd>cp<CR>", optsTable({}))
keymap.set("n", "<leader><down>", "<Cmd>lne<CR>", optsTable({}))
keymap.set("n", "<leader><up>", "<Cmd>lp<CR>", optsTable({}))

keymap.set("n", "<leader>qo", "<Cmd>copen<CR>", optsTable({}))
keymap.set("n", "<leader>wo", "<Cmd>lopen<CR>", optsTable({}))
keymap.set("n", "<leader>qq", "<Cmd>cclose<CR>", optsTable({}))
keymap.set("n", "<leader>wq", "<Cmd>lclose<CR>", optsTable({}))

keymap.set("n", "<leader>;", function()
	vim.cmd.cclose()
	vim.cmd("silent update")
	require("util.async_make").async_make()
end, optsTable({}))

-- ` -> '
keymap.set("n", "'", "`", optsTable({}))

-- quit all
keymap.set("n", "<leader>qp", function()
	vim.fn.jobstart("quit_nvim_periodically.sh")
end, optsTable({}))

-- better scrolling
keymap.set("n", "<Down>", "<C-e>", optsTable({ desc = "scroll down one line" }))
keymap.set("n", "<Up>", "<C-y>", optsTable({ desc = "scroll up one line" }))

-- better qutting
keymap.set("n", "qq", "<Cmd>q!<CR>", optsTable({ desc = "quit without saving" }))

-- replacing '0'and '$' with H and L
keymap.set("n", "0", "H", optsTable({ desc = "swapped with H" }))
keymap.set("n", "$", "L", optsTable({ desc = "swapped with L" }))

keymap.set("n", "<C-o>", "<C-o>zz", optsTable({}))

-- creating text objects (vimtex takes care of this)
keymap.set({ "o", "x" }, "i$", ":<c-u>normal! t$vT$<CR>", optsTable({}))
keymap.set({ "o", "x" }, "a$", ":<c-u>normal! f$vF$<CR>", optsTable({}))

-- opening messages
-- keymap.set("n", "<leader>nn", "<Cmd>messages<CR>", optsTable({ desc = "Open messages" }))

-- increment
keymap.set({ "n" }, "<C-p>", "<C-a>", optsTable({}))
