local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local lower_first = function(args)
    return string.lower(args[1]:sub(1,1)) .. args[1]:sub(2)
end

ls.add_snippets("typescriptreact", {
    s("rus", {
        t("interface "),
        i(1, "PlaceHolder"),
        t(" {"),
        t({"", "    //"}),
        t({"", "}"}),
        t({"", ""}),
        t("const ["),
        f(function(args) return string.lower(args[1]:sub(1,1)) .. args[1]:sub(2) end, {1}),
        t(", set"),
        i(1),
        t("] = React.useState<"),
        i(1),
        t(">("),
        i(2, "1"),
        t(")"),
    }),
})

