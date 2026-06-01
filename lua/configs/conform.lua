local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    python = { "ruff_fix", "black" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    css = { "prettier" },
    html = { "prettier" },
  },
}

return options
