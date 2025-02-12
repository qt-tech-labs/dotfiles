return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      -- transparent_sidebar = true,
      styles = {
        sidebars = "transparent",
        -- floats = "transparent",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
}
