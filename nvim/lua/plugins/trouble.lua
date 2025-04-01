return {
  "folke/trouble.nvim",
  keys = {
    -- disable the keymap to grep files
    -- { "<leader>/", false },
    -- change a keymap
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true win.position=right<cr>",
      desc = "List out ERROR",
    },
  },
}
