return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  opts = {
    servers = {
      sourcekit = {},
    },
    setup = {
      sourcekit = function(_, opts)
        local lspconfig = require("lspconfig")
        lspconfig["sourcekit"].setup({})
      end,
    },
  },
}
