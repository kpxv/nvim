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
	s(
		{ trig = ";a ", snippetType = "autosnippet", },
		{ t("\\alpha "), }
	),
	s(
		{ trig = ";b ", snippetType = "autosnippet", },
		{ t("\\beta "), }
	),
	s(
		{ trig = ";g ", snippetType = "autosnippet", },
		{ t("\\gamma "), }
	),
	s(
		{ trig = ";d ", snippetType = "autosnippet", },
		{ t("\\delta "), }
	),
	s(
		{ trig = ";D ", snippetType = "autosnippet", },
		{ t("\\Delta "), }
	),
	s(
		{ trig = ";int", snippetType = "autosnippet", },
		{ t("\\integral"), }
	),
	s({ trig = "* ", snippetType = "autosnippet" },
		fmta([[
		\cdot 
		]],
			{}
		)
	),
}
