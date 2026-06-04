return {
  "nvim-lua/plenary.nvim",
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      local null_ls = require "null-ls"
      local formatting = null_ls.builtins.formatting
      null_ls.setup {
        sources = {
          formatting.prettier.with { filetypes = { "json", "jsonc" } },
          -- Python
          formatting.black.with { filetypes = { "python" } },
        },
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate | TSInstallAll",
    opts = function()
      return require "configs.treesitter"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },
  -- debug
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "eyohadrian/term-edit.nvim",
    event = "TermOpen",
    version = "1.*",
    opts = {
      -- Mandatory option:
      -- Set this to a lua pattern that would match the end of your prompt.
      -- Or a table of multiple lua patterns where at least one would match the
      -- end of your prompt at any given time.
      -- For most bash/zsh user this is '%$ '.
      -- For most powershell/fish user this is '> '.
      -- For most windows cmd user this is '>'.
      prompt_end = "%$ ",
      -- How to write lua patterns: https://www.lua.org/pil/20.2.html
    },
  },
}
