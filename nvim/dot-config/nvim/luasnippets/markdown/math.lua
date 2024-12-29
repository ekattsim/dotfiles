local ls = require("luasnip")

return {
	ls.snippet(
		{
			trig = "([%w)]);s", -- square
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>^{2}", {
			ls.function_node(get_capture),
		})
	),

	ls.snippet(
		{
			trig = "([%w)]);c", --cube
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>^{3}", {
			ls.function_node(get_capture),
		})
	),

	ls.snippet(
		{
			trig = "([%w)%]]);t", -- general power
			trigEngine = "pattern",
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>^{<>}", {
			ls.function_node(get_capture),
			ls.insert_node(1),
		})
	),

	ls.snippet({
		trig = ";q", -- sqrt
		wordTrig = false,
		trigEngine = "pattern",
		snippetType = "autosnippet",
	}, fmta("\\sqrt{<>}", { ls.insert_node(1) })),

	ls.snippet({ -- delicate, place space before expanding
		trig = "([^%a])ff", -- fraction
		wordTrig = false,
		trigEngine = "pattern",
		snippetType = "autosnippet",
	}, fmta("<>\\frac{<>}{<>}", { ls.function_node(get_capture), ls.insert_node(1), ls.insert_node(2) })),

	ls.snippet(
		{
			trig = " %*", -- \cdot
			snippetType = "autosnippet",
			trigEngine = "pattern",
			wordTrig = false,
		},
		fmta("\\cdot <>", {
			ls.insert_node(0),
		})
	),

	ls.snippet(
		{ trig = "([^%w\\]?)dm", snippetType = "autosnippet", trigEngine = "pattern" }, -- display math
		fmta(
			[[
      <>\[
        <>
      \]
    ]],
			{
				ls.function_node(get_capture),
				ls.insert_node(1),
			}
		)
	),

	ls.snippet(
		{ trig = ";alg", snippetType = "autosnippet" },
		fmta(
			[[
      \begin{align*}
        <>
      \end{align*}
    ]],
			{ ls.insert_node(0) }
		)
	),

	ls.snippet({ trig = "$", snippetType = "autosnippet" }, fmta("$<>$<>", { ls.insert_node(1), ls.insert_node(0) })),

	--[[ ls.snippet({
		trig = "([^%w\\]?)cc",
		snippetType = "autosnippet",
		trigEngine = "pattern",
		wordTrig = false,
	}, fmta("<><>{<>}", { ls.function_node(get_capture), ls.insert_node(1), ls.insert_node(2) })), ]]

	ls.snippet({
		trig = "~~",
		snippetType = "autosnippet",
		wordTrig = false,
	}, fmta("\\approx ", {})),

	ls.snippet({
		trig = "__",
		snippetType = "autosnippet",
		wordTrig = false,
		trigEngine = "pattern",
	}, fmta("_{<>}<>", { ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet({
		trig = ";v",
		snippetType = "autosnippet",
		wordTrig = false,
		trigEngine = "pattern",
	}, fmta("\\vec{<>}<>", { ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet({
		trig = ";o",
		snippetType = "autosnippet",
		wordTrig = false,
		trigEngine = "pattern",
	}, fmta("\\overline{<>}<>", { ls.insert_node(1), ls.insert_node(0) })),

	ls.snippet({
		trig = ";m",
		snippetType = "autosnippet",
		wordTrig = false,
		trigEngine = "pattern",
	}, fmta("\\clv{<>}<>", { ls.insert_node(1), ls.insert_node(0) })),
}
