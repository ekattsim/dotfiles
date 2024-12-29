local ls = require("luasnip")

return {
	-- ls.snippet({
	-- 	trig = "-->",
	-- 	snippetType = "autosnippet",
	-- 	wordTrig = false,
	-- 	regTrig = true,
	-- }, {
	-- 	ls.text_node("\\to "),
	-- }),

	ls.snippet(
		{
			trig = ";lm", -- limit
			snippetType = "autosnippet",
			wordTrig = false,
		},
		fmta("\\lim_{<>\\to <>} <>", {
			ls.insert_node(1, "x"),
			ls.insert_node(2),
			ls.insert_node(3, "f(x)"),
		})
	),
	ls.snippet({
		trig = "([^%a]);sin", -- sin
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>\\sin(<>)<>", { ls.function_node(get_capture), ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet({
		trig = "([^%a]);cos", -- cos
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>\\cos(<>)", { ls.function_node(get_capture), ls.insert_node(1) })),

	ls.snippet({
		trig = "([^%a]);tan", -- tan
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>\\tan(<>)", { ls.function_node(get_capture), ls.insert_node(1) })),

	ls.snippet({
		trig = "([^%a]);sec", -- sec
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>\\sec(<>)", { ls.function_node(get_capture), ls.insert_node(1) })),

	ls.snippet({
		trig = "([^%a]);csc", -- csc
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>\\csc(<>)", { ls.function_node(get_capture), ls.insert_node(1) })),

	ls.snippet({
		trig = "([^%a]);cot", -- cot
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>\\cot(<>)", { ls.function_node(get_capture), ls.insert_node(1) })),

	ls.snippet(
		{
			trig = "\\sum",
			snippetType = "autosnippet",
			wordTrig = false,
			regTrig = true,
		},
		fmta("\\sum_{<>= <>}^{<>}<>", {
			ls.insert_node(1),
			ls.insert_node(2),
			ls.insert_node(3),
			ls.insert_node(4),
		})
	),

	ls.snippet({
		trig = ";%(",
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("\\left(<>\\right)<>", { ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet({
		trig = "([^;])%(",
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>(<>)<>", { ls.function_node(get_capture), ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet(
		{
			trig = ";i",
			snippetType = "autosnippet",
			wordTrig = false,
		},
		fmta("\\displaystyle\\int_{<>}^{<>} <>d<>", {
			ls.insert_node(1),
			ls.insert_node(2),
			ls.insert_node(3, "f(x)"),
			ls.insert_node(4, "x"),
		})
	),

	ls.snippet(
		{
			trig = ";%[",
			snippetType = "autosnippet",
			wordTrig = false,
			trigEngine = "pattern",
		},
		fmta("\\left[<>\\right]<>", {
			ls.insert_node(1),
			ls.insert_node(0),
		})
	),

	ls.snippet({
		trig = "([^;])%[",
		snippetType = "autosnippet",
		wordTrig = false,
		regTrig = true,
	}, fmta("<>[<>]<>", { ls.function_node(get_capture), ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet({
		trig = "_%^",
		snippetType = "autosnippet",
		wordTrig = false,
		trigEngine = "pattern",
	}, fmta("_{<>}^{<>}<>", { ls.insert_node(1), ls.insert_node(2), ls.insert_node(0) })),

	ls.snippet(
		{
			trig = ";ln",
			snippetType = "autosnippet",
			wordTrig = false,
			trigEngine = "pattern",
		},
		fmta("\\ln{<>}<>", {
			ls.insert_node(1),
			ls.insert_node(0),
		})
	),

	ls.snippet(
		{
			trig = ";|",
			snippetType = "autosnippet",
			wordTrig = false,
			trigEngine = "pattern",
		},
		fmta("\\left|<>\\right|<>", {
			ls.insert_node(1),
			ls.insert_node(0),
		})
	),

	ls.snippet(
		{
			trig = ";h",
			snippetType = "autosnippet",
			wordTrig = false,
			trigEngine = "pattern",
		},
		fmta("\\theta <>", {
			ls.insert_node(0),
		})
	),

	ls.snippet({
		trig = ";d",
		snippetType = "autosnippet",
		wordTrig = false,
		trigEngine = "pattern",
	}, fmta("\\frac{d<>}{d<>}<>", { ls.insert_node(1), ls.insert_node(2), ls.insert_node(0) })),
}
