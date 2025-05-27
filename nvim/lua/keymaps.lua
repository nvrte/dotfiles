-- KEYMAPS
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "


-- Save and quit
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>W", ":wa<CR>", { desc = "Save all" })
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- Session management
map("n", "<leader>\\s", "<cmd>SessionSave<CR>", { desc = "Save Session" })
map("n", "<leader>\\p", "<cmd>SessionSearch<CR>", { desc = "Search Sessions" })
map("n", "<leader>\\r", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
map("n", "<leader>\\d", "<cmd>SessionDelete<CR>", { desc = "Delete Session" })

-- Tabs
map("n", "<leader>t", "<cmd>tabnew<CR><cmd>:Telescope find_files<CR>", { desc = "Open new tab" })
--map("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>h", "gT", { desc = "Switch tab left" })
map("n", "<leader>j", "gt", { desc = "Switch tab right" })

-- LSP bindings (if not already set elsewhere)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Docs" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>dl", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Line Diagnostics" })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<leader><Tab>", 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  noremap = true,
  replace_keycodes = false,
})
