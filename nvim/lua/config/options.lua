-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Alternatively, set a custom color
vim.cmd([[
  highlight LspDiagnosticsFloatingWarning guibg=#D3D3D3
  highlight LspDiagnosticsFloatingError guibg=#D3D3D3
]])
vim.g.lazyvim_picker = "telescope"

-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "🤾", texthl = "", linehl = "", numhl = "" })
vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#FF0000", bold = true, underline = true })
vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#ffffff", underline = true })
