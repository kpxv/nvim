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
    s({ trig = ";start", snippetType = "autosnippet" },
        fmta([[
		\documentclass{article}

		\usepackage[a4paper, margin=1in]{geometry}

		\title{<>}
		\author{Aden Perry}
		\date{\today}

		\begin{document}
		\maketitle

		<>

		\end{document}
		]],
            { i(1), i(0) }
        )
    ),
    s({ trig = ";smath", snippetType = "autosnippet" },
        fmta([[
		\documentclass{article}

		\usepackage{graphicx}
		\usepackage[a4paper, margin=1in]{geometry}
		\usepackage{amsmath}
		\usepackage{IEEEtrantools}

		\graphicspath{{./assets/}}

		\title{<>}
		\author{Aden Perry}
		\date{\today}

		\begin{document}
		\maketitle

		<>

		\end{document}
		]],
            { i(1), i(0) }
        )
    ),
    s({ trig = ";sfren", snippetType = "autosnippet" },
        fmta([[
		\documentclass{article}

		\usepackage[a4paper, margin=1in]{geometry}
		\usepackage[french]{isodate}

		\title{<>}
		\author{Aden Perry}
		\date{\today}

		\begin{document}
		\maketitle

		<>

		\end{document}
		]],
            { i(1), i(0) }
        )
    ),
    s({ trig = ";scmpe", snippetType = "autosnippet" },
        fmta([[
\documentclass{article}

\usepackage{graphicx}
\usepackage[a4paper, margin=1in]{geometry}
\usepackage{amsmath}
\usepackage{IEEEtrantools}
\usepackage{karnaugh-map}

\graphicspath{{./assets/}}

\title{<>}
\author{Aden Perry}
\date{\today}

\begin{document}
\maketitle

<>

\end{document}
]],
            { i(1), i(0) }
        )
    ),
}
