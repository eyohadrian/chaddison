return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  event = "VeryLazy",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      -- {
      --   name = "MenteCobre",
      --   path = "~/MenteCobre",
      -- },
      {
        name = "kepano-obsidian-main",
        path = "~/Downloads/kepano-obsidian-main",
      },
    },
    picker = {
      name = "telescope.nvim",
    },
    ui = {enable = false}
  },
}
