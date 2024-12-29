return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
  },
	enabled = true,
}
