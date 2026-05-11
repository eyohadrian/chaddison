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
          -- o si no usas prettierd:

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
    -- https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-mappings.txt
    -- config = function()
    --   -- Desactiva los keymaps por defecto del plugin
    --   vim.g.VM_default_mappings = 0
    --
    --   -- Define tus propios atajos
    --   vim.g.VM_maps = {
    --     -- seleccionar siguiente ocurrencia
    --     ["Find Under"] = "<M-d>",
    --     ["Find Subword Under"] = "<C-d>",
    --
    --     -- añadir cursor arriba/abajo
    --     ["Add Cursor Down"] = "<M-j>",  -- Alt+j
    --     ["Add Cursor Up"]   = "<M-k>",  -- Alt+k
    --
    --     -- por si quieres entrar al modo de selección manual
    --     ["Select All"] = "<Leader>A",
    --   }
    -- end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

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
    "chomosuke/term-edit.nvim",
    event = "TermOpen",
    version = "1.*",
  },
}
