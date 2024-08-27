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
    s({
        trig = ";lsnip",
        snippetType = "autosnippet",
        regTrig = false
    }, {
        t({ "require(\"luasnip\").snippet({", "\ttrig=\"" }),
        i(1),
        t({ "\",", "\tsnippetType=\"" }),
        i(2),
        t({ "\",", "\tregTrig=" }),
        i(3),
        t({ ",", "},{", "\t" }),
        i(4),
        t({ "", "})" })
    }),

    require("luasnip").snippet({
            trig = ";snip",
            snippetType = "autosnippet",
            regTrig = false,
        },
        fmta([=[
            require("luasnip").snippet({
                    trig="<>",
                    snippetType="<>",
                    regTrig=<>,
                },
                fmta( [[
                        <>
                    ]],
                    {
                        <>
                    })
            ),
        ]=],
            {
                i(1),
                i(2),
                i(3),
                i(4),
                i(5),
            })
    ),

    require("luasnip").snippet({
            trig = "(regTrig%=)true",
            snippetType = "autosnippet",
            regTrig = true,
            wordTrig = false
        },
        fmta([[
            regTrig=true,
            wordTrig=false
        ]],
            {
            })
    ),

}
