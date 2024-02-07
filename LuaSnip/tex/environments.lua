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
    require("luasnip").snippet({
        trig="env",
        snippetType="autosnippet",
        regTrig=false,
    },
    fmta( [[
            \begin{<>}
                <>
            \end{<>}
        ]],
        {
            i(1),
            i(2),
            rep(1),
        })
    ),

    require("luasnip").snippet({
        trig="imz",
        snippetType="autosnippet",
        regTrig=false,
    },
    fmta(  [[
        \begin{itemize}
            <>
        \end{itemize}
        ]],
        {
            i(1)
        })
    ),

    require("luasnip").snippet({
        trig="enm",
        snippetType="autosnippet",
        regTrig=false,
    },
    fmta( [[
            \begin{enumerate}
                <>
            \end{enumerate}
        ]],
        {
            i(1)
        })
    ),

    require("luasnip").snippet({
            trig="ima",
            snippetType="autosnippet",
            regTrig=false,
        },
        fmta( [[
                \begin{enumerate}[label=\Alph*]
                    <>
                \end{enumerate}
            ]],
            {
                i(1)
            })
    ),

    require("luasnip").snippet({
        trig="`beg",
        snippetType="autosnippet",
        regTrig=false,
    },
    fmta( [[
            \documentclass{article}
            \usepackage{datetime}
            \usepackage{enumitem}
            \newdate{date}{<>}{<>}{<>}
            \date{\displaydate{date}}
            \title{<>}

            \begin{document}
            \maketitle

            <>

            \end{document}
        ]],
        {
            i(1), i(2), i(3), i(4), i(0)
        })
    ),
}
