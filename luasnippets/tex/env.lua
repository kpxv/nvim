local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s({ trig = ";env", snippetType = "autosnippet"},
		fmta([[
		\begin{<>}
			<>
		\end{<>}
		]],
			{ i(1), i(2), i(1) }
		)
	),
	s({ trig = ";itmz", snippetType = "autosnippet"},
		fmta([[
		\begin{itemize}
			\item <>
		\end{itemize}
		]],
			{ i(1) }
		)
	),
	s({ trig = ";enum", snippetType = "autosnippet"},
		fmta([[
		\begin{enumerate}
			\item <>
		\end{enumerate}
		]],
			{ i(1) }
		)
	),
	s({ trig = ";ali", snippetType = "autosnippet"},
		fmta([[
		\begin{align*}
			<>
		\end{align*}
		]],
			{ i(1) }
		)
	),
}
