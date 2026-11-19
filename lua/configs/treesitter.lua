pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

local ts = require("nvim-treesitter")

ts.install({
  "lua",
  "luadoc",
  "printf",
  "vim",
  "vimdoc",
  "html",
  "css",
  "python",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "vim",
    "html",
    "css",
    "python",
  },
  callback = function()
    vim.treesitter.start()
  end,
})
