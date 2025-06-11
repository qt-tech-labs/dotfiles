local git = {

    -- Next change
    nextHunk = function()
        vim.fn.VSCodeNotify("workbench.action.editor.nextChange")
    end,

    -- Lazy git
    lazygit = function()
        vim.fn.VSCodeNotify("lazygit-vscode.toggle")
    end,

    -- if gitlens installed
    graph = function()
        vim.fn.VSCodeNotify("gitlens.showGraphPage")
    end,
}

-- git
vim.keymap.set({ "n" }, "<leader>gg", git.lazygit)
vim.keymap.set({ "n" }, "<leader>gn", git.nextHunk)
-- vim.keymap.set({ "n" }, "<leader>gg", git.graph)
