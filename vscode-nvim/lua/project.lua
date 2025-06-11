local project = {
    switch = function()
        vim.fn.VSCodeNotify("workbench.action.openRecent")
    end,
}

-- project
vim.keymap.set({ "n" }, "<leader>pp", project.switch)
