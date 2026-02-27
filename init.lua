vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require("configs.dap-python")

require('term-edit').setup({
-- Mandatory option:
-- Set this to a lua pattern that would match the end of your prompt.
-- Or a table of multiple lua patterns where at least one would match the
-- end of your prompt at any given time.
-- For most bash/zsh user this is '%$ '.
-- For most powershell/fish user this is '> '.
-- For most windows cmd user this is '>'.
prompt_end = '%$ ',
-- How to write lua patterns: https://www.lua.org/pil/20.2.html
})
