-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("flutter-tools").setup({}) -- use defaults
-- require("oil").setup()
-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./mysnip" } })
