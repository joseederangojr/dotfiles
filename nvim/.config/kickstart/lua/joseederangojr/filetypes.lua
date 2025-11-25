vim.filetype.add({
  extension = {
    mdx = "mdx",
    log = "log",
    conf = "conf",
    env = "dotenv",
  },
  filename = {
    [".env"] = "sh",
    ["env"] = "sh",
    ["bun.lock"] = "json",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})
