---@diagnostic disable: undefined-global, unused-local
local ls = require("luasnip")

return {
	ls.snippet({
		trig = "hw",
	}, {
		ls.text_node({ "Hi there", "Hey there" }),
	}),
}
