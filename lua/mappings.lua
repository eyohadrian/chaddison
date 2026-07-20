-- add yours here

local map = vim.keymap.set

-- Misc 
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

-- Not used, for now lets deprecate it
-- map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
-- map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

vim.keymap.set("n", "<leader>mc", "<cmd>delmarks 0-9a-zA-Z<CR>", {
  desc = "Clear all marks",
})

vim.keymap.set("n", "<leader>B", "<cmd>%bd|e#|bd#<CR>", {
  desc = "Close all buffers",
})

map("t", "<ESC>", "<C-\\><C-N>", { desc = "escape on terminal mode" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>to", "<cmd>tabnew<CR>",      { desc = "New tab" })
map("n", "<leader>tc", "<cmd>tabclose<CR>",    { desc = "Close tab" })
map("n", "<leader>tn", "<cmd>tabnext<CR>",     { desc = "Next tab" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Prev tab" })


map({ 'n', 'v' }, 'H', '^', { desc = 'Move to the beginning of the line' })
map({ 'n', 'v' }, 'L', '$', { desc = 'Move to the end of the line' })
map('n', '<C-w>+', '<cmd>resize +7<cr>', { desc = 'Increase Window Height', silent = true })
map('n', '<C-w>-', '<cmd>resize -7<cr>', { desc = 'Decrease Window Height', silent = true })
map('n', '<C-w>>', '<cmd>vertical resize +7<cr>', { desc = 'Increase Window Width', silent = true })
map('n', '<C-w><', '<cmd>vertical resize -7<cr>', { desc = 'Decrease Window Width', silent = true })

map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- tabufline
if require("nvconfig").ui.tabufline.enabled then
  map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

  map("n", "<tab>", function()
    require("nvchad.tabufline").next()
  end, { desc = "buffer goto next" })

  map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
  end, { desc = "buffer goto prev" })

  map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
  end, { desc = "buffer close" })
end

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree focus window" })

-- Terminal
map("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Terminal en buffer completo" })

-- Telescope
local builtin = require('telescope.builtin')

-- Expands git commit hash to 8 characters.
local function git_commits_short()
  builtin.git_commits({
    git_command = {
      "git", "log",
      "--oneline",
      "--abbrev=8",
    },
  })
end

map('n', '<leader>fu', builtin.lsp_references, { desc = 'Telescope find references' })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map('n', '<leader>gB', builtin.git_branches, { desc = 'Telescope git branches' })
map('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })
map('n', '<leader>gc', git_commits_short, { desc = 'Telescope git commits' })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)


-- LSP
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "LSP code action"})
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Debug
map("n", "<F5>", function() require("dap").continue() end, { desc = "DAP Continue" })

map("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP Step Over" })

map("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP Step Into" })

map("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP Step Out" })

map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })

map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end, { desc = "DAP Conditional Breakpoint" })

map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "DAP UI Toggle" })

map("n", "<leader>dt", function() require("dap-python").test_method() end, { desc = "Debug Test Method" })

map("n", "<leader>df", function() require("dap-python").test_class() end, { desc = "Debug Test Class" })


-- Gitsings
local gs = require('gitsigns')

vim.keymap.set("n", "]c", gs.next_hunk, {desc = "Next hunk"})
vim.keymap.set("n", "[c", gs.prev_hunk, {desc = "Prev hunk"})

vim.keymap.set("n", "<leader>hs", gs.stage_hunk, {desc = "Stage hunk"})
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, {desc = "Reset hunk"})
vim.keymap.set("n", "<leader>hp", gs.preview_hunk, {desc = "Preview hunk"})

vim.keymap.set("n", "<leader>hS", gs.stage_buffer, {desc = "Stage buffer hunk"})
vim.keymap.set("n", "<leader>hR", gs.reset_buffer, {desc = "Reset buffer hunk"})

vim.keymap.set("n", "<leader>gb", function()
  gs.blame_line({ full = true })
end, {desc = "Blame line"})

vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, {desc = "Toggle current_line_blame"})

-- opencode.nvim
vim.keymap.set({ "n", "x" }, "<leader>oa", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode" })

vim.keymap.set({ "n", "x" }, "<leader>ox", function()
  require("opencode").select()
end, { desc = "Execute opencode action" })

vim.keymap.set({"n"}, "<leader>ot", function()
  require("opencode").toggle()

end, { desc = "Toggle opencode" })

vim.keymap.set("n", "<leader>ou", function()
  require("opencode").command("session.half.page.up")
end, { desc = "Scroll opencode up" })

vim.keymap.set("n", "<leader>od", function()
  require("opencode").command("session.half.page.down")
end, { desc = "Scroll opencode down" })

vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

-- Obsidian
map("n", "<leader>nl", function ()
  require("custom.obsidian.links_with_preview").execute()
end, { desc = "Show links"})
map("n", "<leader>nf", "<cmd>Obsidian follow_link<CR>", { desc = "Follow Link"})
map("n", "<leader>nb", "<cmd>Obsidian backlinks<CR>", { desc = "Show backlinks"})
map("n", "<leader>nn", "<cmd>Obsidian new<CR>", { desc = "New Note"})
map("n", "<leader>nt", "<cmd>Obsidian new_from_template<CR>", { desc = "New Note from template"})

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })
