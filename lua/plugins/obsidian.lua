return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  event = "VeryLazy",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "MenteCobre",
        path = "~/adrian.asensio.bdn@gmail.com - Google Drive/My Drive/MenteCobre",
      },
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
