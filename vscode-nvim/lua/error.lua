local error = {
    list = function()
        vim.fn.VSCodeNotify("workbench.actions.view.problems")
    end,
    next = function()
        vim.fn.VSCodeNotify("editor.action.marker.next")
    end,
    previous = function()
        vim.fn.VSCodeNotify("editor.action.marker.prev")
    end,
}

-- error
vim.keymap.set({ "n" }, "<leader>el", error.list)
vim.keymap.set({ "n" }, "<leader>en", error.next)
vim.keymap.set({ "n" }, "<leader>ep", error.previous)
