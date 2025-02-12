return {
  {
    "b0o/incline.nvim",
    config = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified

          local grapple_status
          if props.focused then
            grapple_status = require("grapple").name_or_index() or ""
            if grapple_status ~= "" then
              grapple_status = "󰛢 " .. grapple_status .. " "
            end
          else
            grapple_status = " "
          end

          local bgcol = props.focused and "#ff100f" or "#44406e"
          local res = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            grapple_status,
            { filename, gui = modified and "bold,italic" or "bold" },
            guibg = bgcol,
          }
          table.insert(res, " ")
          return res
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
