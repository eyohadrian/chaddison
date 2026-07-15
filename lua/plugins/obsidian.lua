return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = "VeryLazy",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    frontmatter = {
      enabled = false,
    },
    note = {
      template = vim.NIL,
    },
    workspaces = {
      {
        name = "MenteCobre",
        path = "~/MenteCobre",
        overrides = {
          new_notes_location = "notes_subdir",
          notes_subdir = "_WIP/",
        },
      },
      {
        name = "kepano-obsidian-main",
        path = "~/Downloads/kepano-obsidian-main",
        overrides = {
          new_notes_location = "notes_subdir",
          notes_subdir = "Notes/",
          templates = {
            folder = "Templates/",
          },
        },
      },
    },
    picker = {
      name = "telescope.nvim",
    },
    ui = { enable = false },
  },
}
