-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Delete keys
--
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "L")
--
-- Add new keys
--
-- vim.keymap.set("n", "<leader>r", require("telescope").extensions.flutter.commands, { desc = "Open command Flutter." })
vim.keymap.set("n", "L", function()
  vim.diagnostic.open_float()
end, { desc = "Show the error under the cursor." })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape from the insert mode." })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Escape from the insert mode." })
vim.keymap.set("n", "<leader>.", "<cmd>vertical resize -10<cr>", { desc = "Resize the width by -10" })
-- scroll in lsp
vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })
