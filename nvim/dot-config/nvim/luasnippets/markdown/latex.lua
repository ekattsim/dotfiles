local ls = require("luasnip")

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return ls.snippet_node(nil, ls.insert_node(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return ls.snippet_node(nil, ls.insert_node(1))
	end
end

return {
	s(
		{
			trig = ";env",
			snippetType = "autosnippet",
		},
		fmta(
			[[
				\begin{<>}<>
				<>
				\end{<>}
			]],
			{
				ls.insert_node(1),
				ls.insert_node(2),
				ls.insert_node(0),
				rep(1),
			}
		)
	),
	ls.snippet(
		{ trig = ";eq", snippetType = "autosnippet" }, -- equation
		fmta(
			[[
        \begin{equation}
            <>
        \end{equation}
      ]],
			{ ls.insert_node(1) }
		)
	),

	ls.snippet(
		{ trig = "([^%w\\]?)cd", snippetType = "autosnippet", trigEngine = "pattern", wordTrig = false },
		fmta("<>\\<>{<>}", {
			ls.function_node(get_capture),
			ls.insert_node(1),
			ls.dynamic_node(2, get_visual),
		})
	),

	ls.snippet(
		{ trig = ";enq", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{question}{}
          <>
        \end{question}
      ]],
			{
				ls.insert_node(1),
			}
		)
	),

	ls.snippet(
		{ trig = ";enu", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{enumerate}[(a)]
          \item <>
        \end{enumerate}
      ]],
			{
				ls.insert_node(1),
			}
		)
	),
}
