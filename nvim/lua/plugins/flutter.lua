return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        debugger = { -- integrate with nvim dap + install dart code debugger
          enabled = true,
          -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
          -- see |:help dap.set_exception_breakpoints()| for more info
          exception_breakpoints = {},
          -- Whether to call toString() on objects in debug views like hovers and the
          -- variables list.
          -- Invoking toString() has a performance cost and may introduce side-effects,
          -- although users may expected this functionality. null is treated like false.
          evaluate_to_string_in_debug_views = true,
          register_configurations = function(paths)
            local dap = require("dap")
            -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
            dap.adapters.dart = {
              type = "executable",
              command = paths.flutter_bin,
              args = { "debug-adapter" },
            }
            dap.configurations.dart = {
              --put here config that you would find in .vscode/launch.json
              {
                type = "dart",
                request = "launch",
                name = "Launch",
                cwd = "${workspaceFolder}",
                program = "${workspaceFolder}/lib/main.dart",
                debugSdkLibraries = false,
                debugExternalPackageLibraries = false,
              },
            }
            -- If you want to load .vscode launch.json automatically run the following:
            require("dap.ext.vscode").load_launchjs()
          end,
        },
      })
    end,
  },
  -- {
  --   "hankchiutw/flutter-reload.vim",
  -- },
}
