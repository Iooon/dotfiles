-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line in visual down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line in visual up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Append line below to current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous result and center" })
vim.keymap.set("v", ">>", ">gv", { desc = "Shift right and keep selection" })
vim.keymap.set("v", "<<", "<gv", { desc = "Shift left and keep selection" })

-- action without copying
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without copy" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Print over content without copy" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank line to clipboard if access" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard if access" })

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Select and edit current word under cursor" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
