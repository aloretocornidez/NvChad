local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- Python Formatting
  b.diagnostics.mypy,
  b.diagnostics.ruff,
  b.formatting.black.with{filetypes = {"python"}},

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- markdown 
  -- b.formatting.cspell.with{filetypes = {"markdown"}},
  b.diagnostics.cspell.with{filetypes = {"markdown"}},

  -- bash 
  -- b.diagnostics.bash-language-server.with{filetypes={"bash"}},
}

null_ls.setup {
  debug = true,
  sources = sources,
}
