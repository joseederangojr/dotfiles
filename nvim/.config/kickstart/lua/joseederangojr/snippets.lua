local ls = require("luasnip")

-- Load all snippet files from the snippets directory
local snippets_dir = vim.fn.stdpath("config") .. "/lua/joseederangojr/snippets"
local files = vim.fn.glob(snippets_dir .. "/*.lua", false, true)

for _, file in ipairs(files) do
  local module_name = file:match("^.*/(.+)%.lua$")
  if module_name then
    require("joseederangojr.snippets." .. module_name)
  end
end
