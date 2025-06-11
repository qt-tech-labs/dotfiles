local toggle = {
    toggleActivityBar = function()
        vim.fn.VSCodeNotify("workbench.action.toggleActivityBarVisibility")
    end,
    toggleSideBarVisibility = function()
        vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
    end,
    toggleZenMode = function()
        vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
    end,
    theme = function()
        vim.fn.VSCodeNotify("workbench.action.selectTheme")
    end,
    tree = function()
        vim.fn.VSCodeNotify("workbench.view.explorer")
    end,
}
-- toggle
vim.keymap.set({ "n" }, "<leader>e", toggle.tree)
vim.keymap.set({ "n", "v" }, "<leader>ta", toggle.toggleActivityBar)
vim.keymap.set({ "n", "v" }, "<leader>tz", toggle.toggleZenMode)
vim.keymap.set({ "n", "v" }, "<leader>ts", toggle.toggleSideBarVisibility)
vim.keymap.set({ "n", "v" }, "<leader>tt", toggle.theme)
