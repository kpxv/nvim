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
            trig="cmt",
            snippetType="autosnippet",
            regTrig=false,
        },
        fmta( [[
                vex::motor <>(vex::PORT<>, vex::gearSetting::ratio<>_1, <>);
            ]],
            {
                i(1),
                i(2),
                i(3),
                i(4),
            })
    ),

    require("luasnip").snippet({
            trig="mgr",
            snippetType="snippet",
            regTrig=false,
        },
        fmta( [[
                vex::motor_group <>(<>);
            ]],
            {
                i(1),
                i(2),
            })
    ),

    require("luasnip").snippet({
            trig=";robot_cfg",
            snippetType="snippet",
            regTrig=false,
        },
        fmta( [[
                robot_specs_t robot_cfg = {
                    .robot_radius = <>,
                    .odom_wheel_diam = <>,
                    .odom_gear_ratio = <>,
                    .dist_between_wheels = <>,

                    .drive_correction_cutoff = <>,
                    .drive_feedback = <>,
                    .turn_feedback = <>,
                    .correction_pid = <>,
                };
            ]],
            {
                i(1),
                i(2),
                i(3),
                i(4),
                i(5),
                i(6),
                i(7),
                i(8),
            })
    ),
}
